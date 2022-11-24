import 'package:flutter/material.dart';

class Root extends StatelessWidget {
  final Widget child;
  final bool useSafeArea;
  final PreferredSizeWidget? appbar;
  final Widget? bottomNav;
  final Widget? bottomSheet;
  final FloatingActionButton? fab;

  const Root({Key? key, required this.child, this.useSafeArea = true, this.bottomNav, this.bottomSheet, this.appbar, this.fab}): super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!useSafeArea) {
      return Scaffold(body: child, bottomSheet: bottomSheet);
    }

    return Scaffold(
      body: SafeArea(
        child: child,
      ),
      appBar: appbar,
      bottomNavigationBar: bottomNav,
      bottomSheet: bottomSheet,
      floatingActionButton: fab,
    );
  }
}
