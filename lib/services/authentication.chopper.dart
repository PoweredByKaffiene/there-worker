// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AuthenticationService extends AuthenticationService {
  _$AuthenticationService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AuthenticationService;

  @override
  Future<Response<LoginResult>> login(Map<String, dynamic> body) {
    final String $url = '/authentication/login';
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LoginResult, LoginResult>($request);
  }

  @override
  Future<Response<LogoutResult>> logout() {
    final String $url = '/authentication/logout';
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<LogoutResult, LogoutResult>($request);
  }

  @override
  Future<Response<User>> me() {
    final String $url = '/authentication/me';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<User, User>($request);
  }
}
