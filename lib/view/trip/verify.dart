import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/layout/root.dart';

class VerifyScreen extends StatefulWidget {
  VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  var arguments = Get.arguments;

  RxInt? productId = 0.obs;
  RxInt quantity = 0.obs;

  @override
  void initState() {
    super.initState();

    var arg = arguments['product_id'];
    productId?.value = arg ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;

    return Root(
      appbar: AppBar(
        title: const Text(
          'Verify Shipment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      child: Container(
        margin: const EdgeInsets.all(42),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Product ID',
                      hintText: 'Enter the product ID',
                    ),
                    initialValue: productId?.value == 0
                        ? null
                        : productId?.value.toString(),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Truck No',
                      hintText: 'Enter the truck number',
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              const Size.fromRadius(36)),
                          backgroundColor: MaterialStateProperty.all(
                              colorScheme.secondaryContainer),
                          foregroundColor:
                              MaterialStateProperty.all(colorScheme.secondary),
                        ),
                        onPressed: () => quantity.value--,
                      ),
                      const SizedBox(width: 32),
                      Obx(() => Text(quantity.value.toString(),
                          style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.secondary,
                              fontSize: 28.sp))),
                      const SizedBox(width: 32),
                      SizedBox(
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                const Size.fromRadius(36)),
                            backgroundColor: MaterialStateProperty.all(
                                colorScheme.secondaryContainer),
                            foregroundColor:
                                MaterialStateProperty.all(colorScheme.secondary),
                          ),
                          onPressed: () => quantity.value++,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              child: Text('Verify', style: theme.textTheme.labelLarge?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold)),
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all(const Size.fromHeight(48)),
                backgroundColor:
                    MaterialStateProperty.all(colorScheme.primaryContainer),
                foregroundColor:
                    MaterialStateProperty.all(colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
