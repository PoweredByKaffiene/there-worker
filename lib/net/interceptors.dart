import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_to_regexp/path_to_regexp.dart';

class JsonToTypeConverter extends JsonConverter {

  final Map<Type, Function> typeToJsonFactoryMap;

  const JsonToTypeConverter(this.typeToJsonFactoryMap);

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    String body = utf8.decode(response.bodyBytes); // https://github.com/dart-lang/http/issues/175;

    print("body: $body");

    return response.copyWith(
      body: fromJsonData<BodyType, InnerType>(body, typeToJsonFactoryMap[InnerType]!),
    );
  }

  T fromJsonData<T, InnerType>(String jsonData, Function jsonParser) {
    if (jsonData.isEmpty) jsonData = "{}";

    var jsonMap = json.decode(jsonData);

    if (jsonMap is List) {
      return jsonMap.map((item) => jsonParser(item as Map<String, dynamic>) as InnerType).toList() as T;
    }

    return jsonParser(jsonMap);
  }
}

class AuthInterceptor with RequestInterceptor, ResponseInterceptor {
  static final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  List<String>? whitelist;

  AuthInterceptor({this.whitelist}) : super();

  bool doesWhitelistMatch(String url) {
    return whitelist!.any((path) => pathToRegExp(path, prefix: true).hasMatch(url));
  }

  @override
  FutureOr<Request> onRequest(Request request) async {
    String? token = await _secureStorage.read(key: 'access_token');

    if (whitelist != null && doesWhitelistMatch(request.url.path)) {
      return request;
    }

    if (token == null) return request;

    return request.copyWith(headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
  }

  @override
  FutureOr<Response> onResponse(Response response) async {
    print(response.bodyString);

    // if (response.body is LoginResult) {
    //   await _secureStorage.write(key: 'access_token', value: response.body.tokens.access);
    // }

    return response;
  }
}
