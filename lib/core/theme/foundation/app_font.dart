// lib/core/theme/foundation/app_font.dart

part of 'app_theme.dart';

class AppFont {
  AppFont({
    required this.font,
    required this.textColor,
    required this.hintColor,
    required this.onPrimaryColor,
  });

  final Font font;
  final Color textColor;
  final Color hintColor;
  final Color onPrimaryColor;

  // Display - 큰 제목이나 특별한 강조가 필요한 텍스트
  TextStyle get display1 => TextStyle(
        fontFamily: font.name,
        fontSize: 48,
        fontWeight: font.bold,
        color: textColor,
        height: 1.2,
      );

  TextStyle get display2 => TextStyle(
        fontFamily: font.name,
        fontSize: 40,
        fontWeight: font.bold,
        color: textColor,
        height: 1.2,
      );

  // Headline - 섹션 제목이나 중요 텍스트
  TextStyle get headline1 => TextStyle(
        fontFamily: font.name,
        fontSize: 32,
        fontWeight: font.bold,
        color: textColor,
        height: 1.3,
      );

  TextStyle get headline2 => TextStyle(
        fontFamily: font.name,
        fontSize: 28,
        fontWeight: font.bold,
        color: textColor,
        height: 1.3,
      );

  TextStyle get headline3 => TextStyle(
        fontFamily: font.name,
        fontSize: 24,
        fontWeight: font.bold,
        color: textColor,
        height: 1.3,
      );

  // Title - 일반적인 제목
  TextStyle get title1 => TextStyle(
        fontFamily: font.name,
        fontSize: 22,
        fontWeight: font.semiBold,
        color: textColor,
        height: 1.4,
      );

  TextStyle get title2 => TextStyle(
        fontFamily: font.name,
        fontSize: 20,
        fontWeight: font.semiBold,
        color: textColor,
        height: 1.4,
      );

  TextStyle get title3 => TextStyle(
        fontFamily: font.name,
        fontSize: 18,
        fontWeight: font.semiBold,
        color: textColor,
        height: 1.4,
      );

  // Body - 본문 텍스트
  TextStyle get body1 => TextStyle(
        fontFamily: font.name,
        fontSize: 16,
        fontWeight: font.regular,
        color: textColor,
        height: 1.5,
      );

  TextStyle get body1Medium => body1.copyWith(
        fontWeight: font.medium,
      );

  TextStyle get body1SemiBold => body1.copyWith(
        fontWeight: font.semiBold,
      );

  TextStyle get body1Bold => body1.copyWith(
        fontWeight: font.bold,
      );

  TextStyle get body2 => TextStyle(
        fontFamily: font.name,
        fontSize: 14,
        fontWeight: font.regular,
        color: textColor,
        height: 1.5,
      );

  TextStyle get body2Medium => body2.copyWith(
        fontWeight: font.medium,
      );

  TextStyle get body2SemiBold => body2.copyWith(
        fontWeight: font.semiBold,
      );

  TextStyle get body2Bold => body2.copyWith(
        fontWeight: font.bold,
      );

  TextStyle get body3 => TextStyle(
        fontFamily: font.name,
        fontSize: 12,
        fontWeight: font.regular,
        color: textColor,
        height: 1.5,
      );

  TextStyle get body3Medium => body3.copyWith(
        fontWeight: font.medium,
      );

  TextStyle get body3SemiBold => body3.copyWith(
        fontWeight: font.semiBold,
      );

  TextStyle get body3Bold => body3.copyWith(
        fontWeight: font.bold,
      );

  // Caption - 작은 텍스트, 부가 설명
  TextStyle get caption => TextStyle(
        fontFamily: font.name,
        fontSize: 11,
        fontWeight: font.regular,
        color: textColor,
        height: 1.5,
      );

  TextStyle get captionMedium => caption.copyWith(
        fontWeight: font.medium,
      );

  TextStyle get captionSemiBold => caption.copyWith(
        fontWeight: font.semiBold,
      );

  // Button 텍스트
  TextStyle get buttonLarge => TextStyle(
        fontFamily: font.name,
        fontSize: 16,
        fontWeight: font.semiBold,
        color: onPrimaryColor,
        height: 1.5,
      );

  TextStyle get buttonMedium => TextStyle(
        fontFamily: font.name,
        fontSize: 14,
        fontWeight: font.semiBold,
        color: onPrimaryColor,
        height: 1.5,
      );

  TextStyle get buttonSmall => TextStyle(
        fontFamily: font.name,
        fontSize: 12,
        fontWeight: font.semiBold,
        color: onPrimaryColor,
        height: 1.5,
      );

  // Hint 텍스트
  TextStyle get hintLarge => TextStyle(
        fontFamily: font.name,
        fontSize: 16,
        fontWeight: font.regular,
        color: hintColor,
        height: 1.5,
      );

  TextStyle get hintMedium => TextStyle(
        fontFamily: font.name,
        fontSize: 14,
        fontWeight: font.regular,
        color: hintColor,
        height: 1.5,
      );

  TextStyle get hintSmall => TextStyle(
        fontFamily: font.name,
        fontSize: 12,
        fontWeight: font.regular,
        color: hintColor,
        height: 1.5,
      );

  // 유틸리티 메소드
  TextStyle withColor(TextStyle style, Color color) =>
      style.copyWith(color: color);
  TextStyle withWeight(TextStyle style, FontWeight weight) =>
      style.copyWith(fontWeight: weight);
  TextStyle withSize(TextStyle style, double size) =>
      style.copyWith(fontSize: size);
}
