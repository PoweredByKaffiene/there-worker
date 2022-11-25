import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../widgets/layout/root.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key});

  MobileScannerController cameraController = MobileScannerController();

  void validateCode(String code) {
    if (!code.contains(':')) return;

    var parts = code.split(':');
    if (parts.length != 2) return;

    String label = parts[0];
    String productId = parts[1];

    if (!(label == 'THERE_PRODUCT_ID')) return;

    print(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Root(
      appbar: AppBar(
        title: const Text(
          'Scan Product',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
        ],
      ),
      child: MobileScanner(
        controller: cameraController,
        onDetect: (barcode, args) {
          if (barcode.rawValue == null) {
            debugPrint('failed to scan barcode');
            return;
          }

          final String code = barcode.rawValue!;
          validateCode(code);
        },
      ),
    );
  }
}
