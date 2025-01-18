part of 'app_theme.dart';

class AppFont {
  AppFont({
    required this.font,
    required this.textColor,
    required this.hintColor,
  });

  final Font font;
  final Color textColor;
  final Color hintColor;

  // 기본 텍스트 스타일
  TextStyle get bodyLarge => TextStyle(
        fontFamily: font.name,
        fontSize: 16,
        fontWeight: font.regular,
        color: textColor,
      );

  TextStyle get bodyMedium => TextStyle(
        fontFamily: font.name,
        fontSize: 14,
        fontWeight: font.regular,
        color: textColor,
      );

  TextStyle get bodySmall => TextStyle(
        fontFamily: font.name,
        fontSize: 12,
        fontWeight: font.regular,
        color: textColor,
      );

  // 제목 스타일
  TextStyle get titleLarge => TextStyle(
        fontFamily: font.name,
        fontSize: 22,
        fontWeight: font.bold,
        color: textColor,
      );

  // 힌트 스타일
  TextStyle get hint => TextStyle(
        fontFamily: font.name,
        fontSize: 14,
        fontWeight: font.regular,
        color: hintColor,
      );
}
