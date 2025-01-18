import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qode/core/localization/provider/l10n_provider.dart';
import 'package:qode/core/localization/provider/locale_provider.dart';
import 'package:qode/core/theme/foundation/app_theme.dart';
import 'package:qode/core/theme/providers/theme_provider.dart';

class LocaleTestPage extends ConsumerWidget {
  const LocaleTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final theme = ref.theme;
    final color = theme.color;
    final font = theme.font;
    final currentLocale = ref.watch(localeStateProvider);

    return Scaffold(
      backgroundColor: color.background,
      appBar: AppBar(
        backgroundColor: color.surface,
        title: Text('다국어 테스트', style: font.title1),
        actions: [
          // 언어 변경 버튼
          TextButton(
            onPressed: () {
              final newLocale = currentLocale.languageCode == 'ko'
                  ? const Locale('en')
                  : const Locale('ko');
              ref.read(localeStateProvider.notifier).setLocale(newLocale);
            },
            child: Text(
              currentLocale.languageCode.toUpperCase(),
              style: font.body1Medium.copyWith(color: color.primary),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 현재 로케일 정보
            _buildSection(
              title: '현재 로케일 정보',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoTile('언어 코드', currentLocale.languageCode),
                  const SizedBox(height: 8),
                  _buildInfoTile('국가 코드', currentLocale.countryCode ?? '없음'),
                ],
              ),
              font: font,
              color: color,
            ),

            const SizedBox(height: 32),

            // 번역 테스트
            _buildSection(
              title: '번역 테스트',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTranslationTile(
                    'appName',
                    l10n.appName,
                    font,
                    color,
                  ),
                  const SizedBox(height: 16),
                  _buildTranslationTile(
                    'settings',
                    l10n.settings,
                    font,
                    color,
                  ),
                  const SizedBox(height: 16),
                  _buildTranslationTile(
                    'language',
                    l10n.language,
                    font,
                    color,
                  ),
                ],
              ),
              font: font,
              color: color,
            ),

            const SizedBox(height: 32),

            // 컴포넌트에서의 사용 예시
            _buildSection(
              title: '컴포넌트 테스트',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 버튼 예시
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color.primary,
                      foregroundColor: color.onPrimary,
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.settings),
                    label: Text(l10n.settings),
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
                        Text(l10n.appName, style: font.body1Medium),
                        const SizedBox(height: 8),
                        Text(l10n.settings, style: font.body2Medium),
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

  Widget _buildInfoTile(String label, String value) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(label),
        ),
        Expanded(
          flex: 3,
          child: Text(value),
        ),
      ],
    );
  }

  Widget _buildTranslationTile(
    String key,
    String value,
    AppFont font,
    AppColor color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Key: $key',
            style: font.body3Medium.copyWith(color: color.hint),
          ),
          const SizedBox(height: 4),
          Text(
            'Value: $value',
            style: font.body3Medium,
          ),
        ],
      ),
    );
  }
}
