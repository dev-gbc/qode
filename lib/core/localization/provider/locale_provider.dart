import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_provider.g.dart';

const String _localeKey = 'locale';

@Riverpod(dependencies: [], keepAlive: true)
class LocaleState extends _$LocaleState {
  SharedPreferences? _prefs;

  @override
  Locale build() {
    // 기본 로케일은 시스템 설정을 따름
    return const Locale('ko');
  }

  // 지원하는 로케일 목록
  static const supportedLocales = [
    Locale('ko'), // 한국어
    Locale('en'), // 영어
  ];

  // 로케일 변경
  Future<void> setLocale(Locale locale) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs!.setString(_localeKey, locale.languageCode);
    state = locale;
  }

  // 저장된 로케일 불러오기
  Future<void> loadSavedLocale() async {
    _prefs ??= await SharedPreferences.getInstance();
    final savedLocale = _prefs!.getString(_localeKey);
    if (savedLocale != null) {
      state = Locale(savedLocale);
    }
  }
}
