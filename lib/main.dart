import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qode/core/theme/pages/theme_test_page.dart';
import 'package:qode/core/theme/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.theme;

    return MaterialApp(
      title: 'QR 코드 생성기',
      theme: theme.themeData,
      home: const ThemeTestPage(),
    );
  }
}
