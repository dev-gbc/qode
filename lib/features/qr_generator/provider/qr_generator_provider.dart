import 'package:qode/features/qr_generator/models/qr_code_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_generator_provider.g.dart';

@riverpod
class QRGenerator extends _$QRGenerator {
  @override
  QRCode? build() {
    return null;
  }

  void updateQRCode(QRCode qrCode) {
    state = qrCode;
  }
}
