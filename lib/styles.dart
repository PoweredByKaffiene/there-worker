import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

// const FlexSchemeData _myFlexScheme = FlexSchemeData(
//   name: 'There',
//   description: 'Colorscheme dedicated to the There Project',
//   light: FlexSchemeColor(
//     primary: Color(0xFF70C398),
//     primaryContainer: Color(0xFFDDF2E8),
//     secondary: Color(0xFF2C1B64),
//     secondaryContainer: Color(0xFFC7C0D9),
//     tertiary: Color(0xFFFF8A93),
//     tertiaryContainer: Color(0xFFFFE4E6),
//     error: Color(0xFFDF576B),
//     errorContainer: Color(0xFFF9DDE1)
//   ),
//   // TODO: choose a colorscheme for darktheme
//   dark: FlexSchemeColor(
//     primary: Color(0xFFB1CFF5),
//     primaryContainer: Color(0xFF3873BA),
//     secondary: Color(0xFFFFD270),
//     secondaryContainer: Color(0xFFD26900),
//     tertiary: Color(0xFFC9CBFC),
//     tertiaryContainer: Color(0xFF535393),
//   ),
// );

// FlexColorScheme lightColorScheme = FlexColorScheme.light(
//   colors: _myFlexScheme.light,
//   useMaterial3: true
// );

// FlexColorScheme darkColorScheme = FlexColorScheme.dark(
//     colors: _myFlexScheme.dark,
//     useMaterial3: true
// );

// This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
FlexColorScheme lightColorScheme = FlexColorScheme.light(
  scheme: FlexScheme.money,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 9,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);

FlexColorScheme darkColorScheme = FlexColorScheme.dark(
  scheme: FlexScheme.money,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 15,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,


ThemeData lightThemeData = lightColorScheme.toTheme.copyWith(
  textTheme: GoogleFonts.interTextTheme(lightColorScheme.textTheme)
);

ThemeData darkThemeData = darkColorScheme.toTheme.copyWith(
  textTheme: GoogleFonts.interTextTheme(darkColorScheme.textTheme)
);