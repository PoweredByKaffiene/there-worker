import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:there_worker/controller/auth_controller.dart';
import 'package:there_worker/controller/wallet_controller.dart';
import 'package:there_worker/gen/assets.gen.dart';

import '../widgets/layout/root.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  AuthenticationController _authController =
      Get.find<AuthenticationController>();
  WalletController _walletController = Get.find<WalletController>();

  void onClickStart() {
    Get.toNamed('/start');
  }

  void onClickEnd() {
    Get.toNamed('/end');
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);

    var colorScheme = theme.colorScheme;

    return Root(
      appbar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.logout),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    _authController.logout();
                    Get.offAllNamed('/login');
                  },
                  child: const Text('Logout'),
                ),
              ),
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    _walletController.killSession();
                    Get.offAllNamed('/connect');
                  },
                  child: const Text('Disconnect'),
                ),
              ),
            ],
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(42),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap:onClickStart,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            height: double.infinity,
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 5,
                              child: Assets.img.tripStart.image(
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("Trip Start", style: theme.textTheme.headline4?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Expanded(
                    child: GestureDetector(
                      onTap: onClickEnd,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            height: double.infinity,
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 5,
                              child: Assets.img.tripEnd.image(
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("Trip End", style: theme.textTheme.headline4?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
