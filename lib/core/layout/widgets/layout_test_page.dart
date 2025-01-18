import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qode/core/layout/responsive_layout.dart';
import 'package:qode/core/theme/foundation/app_theme.dart';
import 'package:qode/core/theme/providers/theme_provider.dart';
import 'package:qode/features/qr_generator/views/pages/home_page.dart';

class LayoutTestPage extends ConsumerWidget {
  const LayoutTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.theme;
    final color = theme.color;
    final font = theme.font;

    return Scaffold(
      backgroundColor: color.background,
      appBar: AppBar(
        backgroundColor: color.surface,
        title: Text('레이아웃 테스트', style: font.title1),
        actions: [
          // 테마 토글 버튼
          IconButton(
            icon: Icon(
              theme.mode == AppMode.light ? Icons.dark_mode : Icons.light_mode,
              color: color.text,
            ),
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
          ),
        ],
      ),
      body: Column(
        children: [
          // 현재 화면 크기 표시
          Container(
            padding: const EdgeInsets.all(16),
            color: color.surface,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '현재 화면 너비: ${constraints.maxWidth.toStringAsFixed(0)}px',
                      style: font.body1Medium,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '레이아웃 타입: ${LayoutType.fromWidth(constraints.maxWidth).name.toUpperCase()}',
                      style: font.body1Medium,
                    ),
                  ],
                );
              },
            ),
          ),
          // 홈페이지 레이아웃
          const Expanded(
            child: HomePage(),
          ),
        ],
      ),
    );
  }
}
