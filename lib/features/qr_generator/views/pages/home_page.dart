import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qode/core/layout/responsive_layout.dart';
import 'package:qode/core/theme/providers/theme_provider.dart';
import 'package:qode/shared/widgets/custom_card.dart';
import 'package:qode/shared/widgets/custom_text_field.dart';
import 'package:qode/shared/widgets/gradient_button.dart';
import 'package:qode/shared/widgets/icon_container.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.theme.color;
    final font = ref.theme.font;

    return Scaffold(
      backgroundColor: color.background,
      body: const ResponsiveLayout(
        mobile: _MobileLayout(),
        tablet: _TabletLayout(),
        desktop: _DesktopLayout(),
      ),
    );
  }
}

class _MobileLayout extends ConsumerWidget {
  const _MobileLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ResponsivePadding(
      child: Column(
        children: [
          /// URL 입력 카드
          _UrlInputCard(),
          SizedBox(height: 16),

          /// 빠른 액션 버튼들
          _QuickActions(),
          SizedBox(height: 16),

          /// 커스터마이징 옵션
          _CustomizationCard(),
          SizedBox(height: 16),

          /// QR 코드 프리뷰
          Expanded(
            child: _QrPreviewCard(),
          ),
        ],
      ),
    );
  }
}

class _TabletLayout extends ConsumerWidget {
  const _TabletLayout({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ResponsivePadding(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 왼쪽 패널 (입력 & 컨트롤)
          Expanded(
            flex: 2,
            child: Column(
              children: [
                /// URL 입력 카드
                _UrlInputCard(),
                SizedBox(height: 16),

                /// 빠른 액션 버튼들
                _QuickActions(),
                SizedBox(height: 16),

                /// 커스터마이징 옵션
                _CustomizationCard(),
              ],
            ),
          ),
          SizedBox(width: 24),

          /// 오른쪽 패널 (QR 코드 프리뷰)
          Expanded(
            flex: 3,

            /// QR 코드 프리뷰
            child: _QrPreviewCard(),
          ),
        ],
      ),
    );
  }
}

class _DesktopLayout extends ConsumerWidget {
  const _DesktopLayout({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ResponsivePadding(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 왼쪽 패널 (입력 & 컨트롤)
          Expanded(
            flex: 3,
            child: Column(
              children: [
                /// URL 입력 카드
                _UrlInputCard(),
                SizedBox(height: 24),

                /// 빠른 액션 버튼들
                _QuickActions(),
                SizedBox(height: 24),

                /// 커스터마이징 옵션
                _CustomizationCard(),
              ],
            ),
          ),
          SizedBox(width: 32),

          /// 오른쪽 패널 (QR 코드 프리뷰)
          Expanded(
            flex: 4,

            /// QR 코드 프리뷰
            child: _QrPreviewCard(),
          ),
        ],
      ),
    );
  }
}

/// URL 입력 카드
class _UrlInputCard extends ConsumerWidget {
  const _UrlInputCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.theme.font;

    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더
          Row(
            children: [
              const IconContainer(
                icon: Icon(Icons.qr_code),
              ),
              const SizedBox(width: 12),
              Text('Create QR Code', style: font.title1),
            ],
          ),
          const SizedBox(height: 24),
          // 입력 필드
          const CustomTextField(
            hintText: 'Enter your URL or text',
          ),
          const SizedBox(height: 16),
          // 버튼
          Row(
            children: [
              Expanded(
                child: GradientButton(
                  onPressed: () {},
                  child: const Text('Generate'),
                ),
              ),
              const SizedBox(width: 12),
              const IconContainer(
                icon: Icon(Icons.qr_code_scanner),
                size: 48,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 빠른 액션 버튼들
class _QuickActions extends ConsumerWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 3,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _ActionButton(
          icon: Icons.download,
          label: 'Download',
          onTap: () {},
        ),
        _ActionButton(
          icon: Icons.share,
          label: 'Share',
          onTap: () {},
        ),
        _ActionButton(
          icon: Icons.image,
          label: 'Add Logo',
          onTap: () {},
        ),
        _ActionButton(
          icon: Icons.palette,
          label: 'Style',
          onTap: () {},
        ),
      ],
    );
  }
}

/// 액션 버튼
class _ActionButton extends ConsumerWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.theme.font;

    return CustomCard(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 12),
          Text(label, style: font.body2Medium),
        ],
      ),
    );
  }
}

/// 커스터마이징 옵션 카드
class _CustomizationCard extends ConsumerWidget {
  const _CustomizationCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.theme.font;

    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Customize', style: font.title2),
          const SizedBox(height: 24),
          // 색상 선택
          Row(
            children: [
              Expanded(
                child: _ColorPicker(
                  label: 'Foreground',
                  colors: const [
                    Color(0xFF000000),
                    Color(0xFFFF5757),
                    Color(0xFF3B82F6),
                    Color(0xFF10B981),
                  ],
                  onColorSelected: (color) {},
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _ColorPicker(
                  label: 'Background',
                  colors: const [
                    Color(0xFFFFFFFF),
                    Color(0xFFF3F4F6),
                    Color(0xFFFEF3C7),
                    Color(0xFFE0E7FF),
                  ],
                  onColorSelected: (color) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // 스타일 선택
          Text('Style', style: font.body2),
          const SizedBox(height: 8),
          Row(
            children: [
              for (final style in ['Basic', 'Rounded', 'Dots', 'Elegant'])
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: _StyleButton(
                      label: style,
                      onTap: () {},
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          // 크기 조절
          Text('Size', style: font.body2),
          const SizedBox(height: 8),
          Slider(
            value: 0.5,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

/// 컬러 피커
class _ColorPicker extends ConsumerWidget {
  const _ColorPicker({
    required this.label,
    required this.colors,
    required this.onColorSelected,
  });

  final String label;
  final List<Color> colors;
  final ValueChanged<Color> onColorSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.theme.font;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: font.body2),
        const SizedBox(height: 8),
        Row(
          children: [
            for (final color in colors)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _ColorButton(
                  color: color,
                  onTap: () => onColorSelected(color),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

/// 컬러 버튼
class _ColorButton extends StatelessWidget {
  const _ColorButton({
    required this.color,
    required this.onTap,
  });

  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

/// 스타일 버튼
class _StyleButton extends ConsumerWidget {
  const _StyleButton({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.theme.color;
    final font = ref.theme.font;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: color.hint.withValues(alpha: 0.2)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: font.body2Medium,
          ),
        ),
      ),
    );
  }
}

/// QR 코드 프리뷰 카드
class _QrPreviewCard extends ConsumerWidget {
  const _QrPreviewCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.theme.color;
    final font = ref.theme.font;

    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Preview', style: font.title1),
              GradientButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.download, size: 20),
                    const SizedBox(width: 8),
                    Text('Download', style: font.buttonMedium),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // QR 코드 프리뷰
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: color.hint.withOpacity(0.1),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: color.hint.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Icon(Icons.qr_code_2, size: 200),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
