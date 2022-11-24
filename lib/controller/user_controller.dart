import 'dart:convert';

import 'package:get/get.dart';

import '../model/user.dart';
import '../services/authentication.dart';


class UserController extends GetxController {
  final AuthenticationService service;

  UserController({
    required this.service,
 });

  final Rx<User?> _user = Rx<User?>(null);

  User? get user => _user.value;

  set user(User? value) {
    _user.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    refreshUser();
  }

  void updateState(User user) {
    this.user = user;
  }

  void reset() {
    user = null;
  }

  void refreshUser() async {
    user = (await service.me()).body;
  }
}