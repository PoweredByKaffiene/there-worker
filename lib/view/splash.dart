import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:there_worker/controller/auth_controller.dart';
import 'package:there_worker/controller/wallet_controller.dart';

import 'dart:async';

import '../utils.dart';
import '../widgets/layout/root.dart';
import '../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  AuthenticationController _authController = Get.find<AuthenticationController>();
  WalletController _walletController = Get.find<WalletController>();

  void navigateAfter() async {
    await _authController.updateAuthState();

    switch (_authController.state) {
      case AuthState.loggedIn:

        if (_walletController.isConnected()) {
          Get.offAllNamed('/home');
        } else {
          Get.offAllNamed('/connect');
        }

        break;
      case AuthState.loggedOut:
        Get.offAllNamed('/login');
        break;
    }
  }

  startTimer() async {
    var _duration = const Duration(seconds: 2, milliseconds: 30);
    return Timer(_duration, navigateAfter);
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;


    changeNavigationBarColor(theme.primaryColor);

    return Root(
      useSafeArea: false,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10.h,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40.w,
                    backgroundImage: Assets.img.logo.image().image),
                ],
              ),
            ),
            Center(child: Text('There Worker', style: theme.textTheme.headline1?.copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
            SizedBox(height: 8.h)
          ],
        ),
      )
      )
    );
  }
}
