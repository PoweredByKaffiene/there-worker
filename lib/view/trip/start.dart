import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
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

    // Try to parse the product ID
    int? parsed;
    try {
      parsed = int.parse(productId);
    } catch (e) {
      debugPrint("Invalid product ID: $productId");
      return;
    }

    Get.toNamed('/verify', arguments: {'product_id': parsed});
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;

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
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return Icon(Icons.flash_off, color: colorScheme.secondaryContainer);
                  case TorchState.on:
                    return Icon(Icons.flash_on, color: colorScheme.secondary);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: colorScheme.primary,
            icon: const Icon(Icons.edit_note),
            iconSize: 32.0,
            onPressed: () => Get.toNamed('/verify', arguments: {'product_id': null}),
          ),
        ],
      ),
      child: MobileScanner(
        allowDuplicates: true,
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
