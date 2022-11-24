import 'package:chopper/chopper.dart' hide Get;
import 'package:get/get.dart';
// import 'package:there/controller/user_controller.dart';
// import 'package:there/services/authentication.dart';

// import '../controller/auth_controller.dart';
// import '../model/user.dart';
import '../net/interceptors.dart';
import '../constants.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChopperClient(
      baseUrl: apiBaseURL,
      converter: JsonToTypeConverter({
        // User: (jsonData) => User.fromJson(jsonData),

        // LoginResult: (jsonData) => LoginResult.fromJson(jsonData),
        // LogoutResult: (jsonData) => LogoutResult.fromJson(jsonData),
      }),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(whitelist: [
          '/authentication/login'
        ])
      ],
      services: [
        // AuthenticationService.create(),
        // LocationService.create()
      ]
    ));

    // Get.put(AuthenticationController(
    //   authService: Get.find<ChopperClient>().getService<AuthenticationService>(),
    // ));
  }
}
