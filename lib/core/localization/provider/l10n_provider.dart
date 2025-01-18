import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qode/core/localization/generated/l10n.dart';
import 'package:qode/core/localization/provider/locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'l10n_provider.g.dart';

@Riverpod(dependencies: [LocaleState])
S l10n(Ref ref) {
  ref.watch(localeStateProvider);
  return S.current;
}
