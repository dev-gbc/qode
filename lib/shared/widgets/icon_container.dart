import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qode/core/theme/providers/theme_provider.dart';

class IconContainer extends ConsumerWidget {
  const IconContainer({
    super.key,
    required this.icon,
    this.size = 40,
    this.iconSize = 24,
    this.borderRadius = 12,
  });

  final Widget icon;
  final double size;
  final double iconSize;
  final double borderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.color;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.primary,
            color.primary.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: IconTheme(
        data: IconThemeData(
          color: color.onPrimary,
          size: iconSize,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
