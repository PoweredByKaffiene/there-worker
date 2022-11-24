import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

void changeStatusBarColor (Color color) async {
  await FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  await FlutterStatusbarcolor.setStatusBarColor(color);
}

void changeNavigationBarColor (Color color) async {
  if (!Platform.isAndroid) return;

  await FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  await FlutterStatusbarcolor.setNavigationBarColor(color, animate: true);
}