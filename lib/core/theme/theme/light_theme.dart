import 'package:flutter/material.dart';
import 'package:qode/core/theme/foundation/app_theme.dart';
import 'package:qode/core/theme/resources/font.dart';

class LightTheme implements AppTheme {
  // 싱글톤 패턴 구현
  static final LightTheme _instance = LightTheme._internal();
  factory LightTheme() => _instance;
  LightTheme._internal() {
    _color = const AppColor(
      background: Colors.white,
      surface: Color(0xFFF8F9FD),
      text: Color(0xFF2B2B2B),
      hint: Color(0xFF9BA1B3),
      primary: Color(0xFF4F6AF0),
      onPrimary: Colors.white,
      error: Color(0xFFE53935),
      onError: Colors.white,
    );

    _font = AppFont(
      font: const Pretendard(),
      textColor: _color.text,
      hintColor: _color.hint,
      onPrimaryColor: _color.onPrimary,
    );
  }

  late final AppColor _color;
  late final AppFont _font;

  @override
  AppMode get mode => AppMode.light;

  @override
  AppColor get color => _color;

  @override
  AppFont get font => _font;

  @override
  ThemeData get themeData => ThemeData(
        brightness: Brightness.light,
        primaryColor: _color.primary,
        scaffoldBackgroundColor: _color.background,
        colorScheme: ColorScheme.light(
          primary: _color.primary,
          onPrimary: _color.onPrimary,
          error: _color.error,
          onError: _color.onError,
          surface: _color.surface,
        ),
        // textTheme: TextTheme(
        //   bodyLarge: _font.bodyLarge,
        //   bodyMedium: _font.bodyMedium,
        //   bodySmall: _font.bodySmall,
        //   titleLarge: _font.titleLarge,
        // ),
      );
}
