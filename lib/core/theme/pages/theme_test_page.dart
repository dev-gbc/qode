// lib/core/theme/test/theme_test_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qode/core/localization/pages/locale_test_page.dart';
import 'package:qode/core/theme/foundation/app_theme.dart';
import 'package:qode/core/theme/providers/theme_provider.dart';

class ThemeTestPage extends ConsumerWidget {
  const ThemeTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.theme;
    final color = theme.color;
    final font = theme.font;

    return Scaffold(
      backgroundColor: color.background,
      appBar: AppBar(
        backgroundColor: color.surface,
        title: Text('테마 테스트', style: font.title1),
        actions: [
          // 로케일 테스트 페이지 이동 버튼
          IconButton(
            icon: Icon(
              Icons.language,
              color: color.text,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LocaleTestPage(),
              ),
            ),
          ),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 색상 섹션
            _buildSection(
              title: '색상 테스트',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildColorTile('Primary', color.primary),
                  _buildColorTile('Background', color.background),
                  _buildColorTile('Surface', color.surface),
                  _buildColorTile('Text', color.text),
                  _buildColorTile('Hint', color.hint),
                  _buildColorTile('Error', color.error),
                ],
              ),
              font: font,
              color: color,
            ),

            const SizedBox(height: 32),

            // 타이포그래피 섹션
            _buildSection(
              title: '타이포그래피 테스트',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title 1', style: font.title1),
                  const SizedBox(height: 8),
                  Text('Body 1 Bold', style: font.body1Bold),
                  const SizedBox(height: 8),
                  Text('Body 1 Medium', style: font.body1Medium),
                  const SizedBox(height: 8),
                  Text('Body 2 Bold', style: font.body2Bold),
                  const SizedBox(height: 8),
                  Text('Hint Text', style: font.hintMedium),
                ],
              ),
              font: font,
              color: color,
            ),

            const SizedBox(height: 32),

            // 컴포넌트 섹션
            _buildSection(
              title: '컴포넌트 테스트',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 버튼 예시
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color.primary,
                      foregroundColor: color.onPrimary,
                    ),
                    onPressed: () {},
                    child: const Text('기본 버튼'),
                  ),
                  const SizedBox(height: 16),

                  // 텍스트 필드 예시
                  TextField(
                    decoration: InputDecoration(
                      hintText: '텍스트 입력',
                      hintStyle: font.hintMedium,
                      filled: true,
                      fillColor: color.surface,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 카드 예시
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: color.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('카드 타이틀', style: font.body1Medium),
                        const SizedBox(height: 8),
                        Text('카드 내용', style: font.body2Medium),
                      ],
                    ),
                  ),
                ],
              ),
              font: font,
              color: color,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Widget content,
    required AppFont font,
    required AppColor color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: font.title1),
        const SizedBox(height: 16),
        content,
      ],
    );
  }

  Widget _buildColorTile(String name, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(
                  '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
