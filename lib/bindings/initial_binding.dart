import 'package:chopper/chopper.dart' hide Get;
import 'package:get/get.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:walletconnect_secure_storage/walletconnect_secure_storage.dart';

import '../controller/auth_controller.dart';
import '../controller/wallet_controller.dart';
import '../model/login_result.dart';
import '../model/logout_result.dart';
import '../model/user.dart';
import '../net/interceptors.dart';
import '../constants.dart';
import '../services/authentication.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChopperClient(
      baseUrl: apiBaseURL,
      converter: JsonToTypeConverter({
        User: (jsonData) => User.fromJson(jsonData),

        LoginResult: (jsonData) => LoginResult.fromJson(jsonData),
        LogoutResult: (jsonData) => LogoutResult.fromJson(jsonData),
      }),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(whitelist: [
          '/authentication/login'
        ])
      ],
      services: [
        AuthenticationService.create(),
      ]
    ));

    Get.put(WalletController());

    Get.put(AuthenticationController(
      authService: Get.find<ChopperClient>().getService<AuthenticationService>(),
    ));
  }
}
