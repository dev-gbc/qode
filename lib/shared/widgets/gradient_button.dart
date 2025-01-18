// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qode/core/theme/providers/theme_provider.dart';

class GradientButton extends ConsumerWidget {
  const GradientButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height = 48,
    this.borderRadius = 12,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final double? width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.theme.color;
    // final font = ref.theme.font;
    final isEnabled = onPressed != null;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: isEnabled
            ? LinearGradient(
                colors: [
                  color.primary,
                  color.primary.withValues(alpha: 0.8),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
        color: isEnabled ? null : color.hint,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Center(
            child: DefaultTextStyle(
              style: ref.theme.font.buttonLarge,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
