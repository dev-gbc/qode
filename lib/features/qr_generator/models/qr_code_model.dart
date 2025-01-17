// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class QRCode {
  final String data;
  final Color foregroundColor;
  final Color backgroundColor;
  final double size;
  QRCode({
    required this.data,
    this.foregroundColor = Colors.black,
    this.backgroundColor = Colors.white,
    required this.size,
  });

  QRCode copyWith({
    String? data,
    Color? foregroundColor,
    Color? backgroundColor,
    double? size,
  }) {
    return QRCode(
      data: data ?? this.data,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      size: size ?? this.size,
    );
  }
}
