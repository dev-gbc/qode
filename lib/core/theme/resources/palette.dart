import 'package:flutter/material.dart';

abstract class Palette {
  // 기본 컬러
  static const Color primary = Color(0xFF2196F3); // 메인 컬러
  static const Color secondary = Color(0xFF03DAC6); // 보조 컬러
  static const Color error = Color(0xFFB00020); // 에러 컬러

  // 라이트 모드 컬러
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF5F5F5);
  static const Color lightText = Color(0xFF000000);
  static const Color lightHint = Color(0xFF9E9E9E);

  // 다크 모드 컬러
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkText = Color(0xFFFFFFFF);
  static const Color darkHint = Color(0xFF757575);
}
