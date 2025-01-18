import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qode/core/theme/foundation/app_theme.dart';
import 'package:qode/core/theme/theme/dark_theme.dart';
import 'package:qode/core/theme/theme/light_theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@Riverpod(dependencies: [])
class Theme extends _$Theme {
  @override
  AppTheme build() {
    return LightTheme();
  }

  void toggleTheme() {
    state = state.mode == AppMode.light ? DarkTheme() : LightTheme();
  }

  void setTheme(AppMode mode) {
    state = mode == AppMode.light ? LightTheme() : DarkTheme();
  }
}

extension ThemeProviderExt on WidgetRef {
  AppTheme get theme => watch(themeProvider);
  AppColor get color => theme.color;
  AppFont get font => theme.font;
  ThemeData get themeData => theme.themeData;
}
