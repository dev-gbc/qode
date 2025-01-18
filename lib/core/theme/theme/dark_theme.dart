import 'package:flutter/material.dart';
import 'package:qode/core/theme/foundation/app_theme.dart';
import 'package:qode/core/theme/resources/font.dart';

class DarkTheme implements AppTheme {
  // 싱글톤 패턴 구현
  static final DarkTheme _instance = DarkTheme._internal();
  factory DarkTheme() => _instance;
  DarkTheme._internal() {
    _color = AppColor(
      background: const Color(0xFF1A1A1A),
      surface: const Color(0xFF242424),
      text: const Color(0xFFF1F1F1),
      hint: const Color(0xFF8E8E8E),
      primary: const Color(0xFF6C85F2),
      onPrimary: const Color(0xFF1A1A1A),
      error: const Color(0xFFEF5350),
      onError: const Color(0xFF1A1A1A),
    );

    _font = AppFont(
      font: const Pretendard(),
      textColor: _color.text,
      hintColor: _color.hint,
    );
  }

  late final AppColor _color;
  late final AppFont _font;

  @override
  AppMode get mode => AppMode.dark;

  @override
  AppColor get color => _color;

  @override
  AppFont get font => _font;

  @override
  ThemeData get themeData => ThemeData(
        brightness: Brightness.dark,
        primaryColor: _color.primary,
        scaffoldBackgroundColor: _color.background,
        colorScheme: ColorScheme.dark(
          primary: _color.primary,
          onPrimary: _color.onPrimary,
          error: _color.error,
          onError: _color.onError,
          surface: _color.surface,
        ),
        textTheme: TextTheme(
          bodyLarge: _font.bodyLarge,
          bodyMedium: _font.bodyMedium,
          bodySmall: _font.bodySmall,
          titleLarge: _font.titleLarge,
        ),
      );
}
