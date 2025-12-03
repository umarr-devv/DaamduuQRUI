import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';

class CustomThemeData {
  CustomThemeData({required this.brightness});

  final Brightness brightness;

  final font = 'Manrope';

  Color by({required Color light, required Color dark}) {
    return brightness == Brightness.light ? light : dark;
  }

  Color get accent => Color(0xffe44641);

  Color get black => Color(0xff000000);

  Color get white => Color(0xffffffff);

  Color get zink => Color(0xff18181b);

  Color get slate => Color(0xff64748b);

  Color get red => Color(0xffdc2626);

  Color get rose => Color(0xffe11d48);

  Color get orange => Color(0xFFf97316);

  Color get green => Color(0xff16a34a);

  Color get blue => Color(0xff2563eb);

  Color get yellow => Color(0xffffc107);

  Color get violet => Color(0xff7c3aed);

  Color get transparent => Color(0x00000000);

  Color get primary => zink;

  Color get primaryBg => white;

  Color get secondaryBg => const Color(0xFFF5F5F6);

  Color get primaryFg => zink;

  Color get secondaryFg => slate;

  Color get invertFg => white;

  Color get textSelect => primaryFg.withValues(alpha: 0.075);

  TextStyle get primaryTextStyle =>
      TextStyle(fontWeight: FontWeight.w500, color: primaryFg, fontSize: 14);
  TextStyle get secondaryTextStyle =>
      TextStyle(fontWeight: FontWeight.w400, color: secondaryFg, fontSize: 14);
  TextStyle get invertTextStyle =>
      TextStyle(fontWeight: FontWeight.w500, color: invertFg, fontSize: 14);

  ThemeData toTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      primaryColor: primary,
      scaffoldBackgroundColor: primaryBg,
      fontFamily: font,
      textSelectionTheme: TextSelectionThemeData(selectionColor: textSelect),
    );
  }

  FThemeData toFTheme() {
    return FThemeData(
      typography: FTypography(defaultFontFamily: font),
      colors: FColors(
        brightness: brightness,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        barrier: secondaryFg,
        background: primaryFg,
        foreground: primaryFg,
        primary: primary,
        primaryForeground: invertFg,
        secondary: secondaryBg,
        secondaryForeground: secondaryFg,
        muted: slate,
        mutedForeground: invertFg,
        destructive: red,
        destructiveForeground: invertFg,
        error: orange,
        errorForeground: invertFg,
        border: secondaryFg,
      ),
    );
  }
}

extension ThemeExtension on ThemeData {
  CustomThemeData get custom => CustomThemeData(brightness: brightness);
}

final lightTheme = CustomThemeData(brightness: Brightness.light).toTheme();
final darkTheme = CustomThemeData(brightness: Brightness.dark).toTheme();
