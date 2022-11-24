import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../model/user.dart';
import '../services/authentication.dart';


enum AuthState {
  loggedIn,
  loggedOut,
}

class AuthenticationController extends GetxController {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  final AuthenticationService authService;

  AuthenticationController({
    required this.authService,
  }) : super();

  final Rx<AuthState> _state = AuthState.loggedOut.obs;

  @override
  void onInit() {
    super.onInit();

    updateAuthState();
  }

  AuthState get state => _state.value;

  set state(AuthState value) => _state.value = value;

  Future updateAuthState() async {
    String? token = await _secureStorage.read(key: 'access_token');

    if (token == null) {
      state = AuthState.loggedOut;
    } else {
      state = AuthState.loggedIn;
    }
  }

  Future deleteToken() async {
    await _secureStorage.delete(key: 'access_token');
  }

  Future<bool> login(email, password) async {
    await authService.login({
      "email": email,
      "password": password,
    });
    await updateAuthState();

    return state == AuthState.loggedIn;
  }

  void logout() async {
    await authService.logout();

    await deleteToken();

    updateAuthState();
  }

  Future<User> fetchAuthenticatedUser() async {
    return (await authService.me()).body!;
  }
}