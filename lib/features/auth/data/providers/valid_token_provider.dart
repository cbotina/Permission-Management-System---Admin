import 'package:hooks_riverpod/hooks_riverpod.dart';

class ValidTokenNotifier extends StateNotifier<bool> {
  ValidTokenNotifier() : super(false);

  setValue(bool value) {
    state = value;
  }
}

final validTokenProvider =
    StateNotifierProvider<ValidTokenNotifier, bool>((ref) {
  return ValidTokenNotifier();
});
