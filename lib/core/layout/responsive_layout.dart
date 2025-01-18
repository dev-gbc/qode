import 'package:flutter/material.dart';

class LayoutBreakpoints {
  static const double mobile = 600;
  static const double tablet = 1240;
}

enum LayoutType {
  mobile,
  tablet,
  desktop;

  /// 현재 화면 너비에 따른 레이아웃 타입 반환
  static LayoutType fromWidth(double width) {
    if (width < LayoutBreakpoints.mobile) return LayoutType.mobile;
    if (width < LayoutBreakpoints.tablet) return LayoutType.tablet;
    return LayoutType.desktop;
  }
}

/// 반응형 레이아웃 위젯
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutType = LayoutType.fromWidth(constraints.maxWidth);
        switch (layoutType) {
          case LayoutType.desktop:
            return desktop ?? tablet ?? mobile;
          case LayoutType.tablet:
            return tablet ?? mobile;
          case LayoutType.mobile:
            return mobile;
        }
      },
    );
  }
}

/// 반응형 패딩
class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutType = LayoutType.fromWidth(constraints.maxWidth);

        // 레이아웃 타입에 따른 패딩 값 계산
        final padding = switch (layoutType) {
          LayoutType.mobile => const EdgeInsets.all(16),
          LayoutType.tablet => const EdgeInsets.all(24),
          LayoutType.desktop => const EdgeInsets.all(32),
        };

        return Padding(
          padding: padding,
          child: child,
        );
      },
    );
  }
}

/// 반응형 최대 너비 제한
class ResponsiveConstraints extends StatelessWidget {
  const ResponsiveConstraints({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutType = LayoutType.fromWidth(constraints.maxWidth);

        // 레이아웃 타입에 따른 최대 너비 계산
        final maxWidth = switch (layoutType) {
          LayoutType.mobile => 600.0,
          LayoutType.tablet => 1240.0,
          LayoutType.desktop => 1440.0,
        };

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
