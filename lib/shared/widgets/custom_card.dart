// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qode/core/theme/providers/theme_provider.dart';

class CustomCard extends ConsumerWidget {
  const CustomCard({
    super.key,
    required this.child,
    this.paddings = const EdgeInsets.all(16),
    this.onTap,
  });

  final Widget child;
  final EdgeInsets paddings;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.theme.color;
    return Material(
      color: color.surface,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: paddings,
          child: child,
        ),
      ),
    );
  }
}
