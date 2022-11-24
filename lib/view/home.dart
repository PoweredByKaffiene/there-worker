import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:there_worker/controller/wallet_controller.dart';

import '../widgets/layout/root.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  WalletController _walletController = Get.find<WalletController>();

  @override
  Widget build(BuildContext context) {
    return Root(
      child: Center(child: Text("address: ${_walletController.session?.accounts.first ?? ''}")),
    );
  }
}