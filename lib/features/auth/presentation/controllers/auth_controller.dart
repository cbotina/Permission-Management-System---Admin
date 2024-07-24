import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/common/providers/active_period_provider.dart';
import 'package:pms_admin/features/auth/application/auth_service.dart';
import 'package:pms_admin/features/auth/data/dto/login_dto.dart';
import 'package:pms_admin/features/auth/data/providers/valid_token_provider.dart';
import 'package:pms_admin/features/auth/presentation/state/auth_state.dart';

class AuthController extends AsyncNotifier<AuthState> {
  late final AuthService _service = ref.watch(authServiceProvider);

  @override
  FutureOr<AuthState> build() {
    return AuthState(AuthResult.logout, null, null, null);
  }

  Future<void> login(LoginDto dto) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _service.login(dto),
    );

    await ref.read(validTokenProvider.notifier).setValue(true);
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _service.logout(),
    );
    await ref.read(validTokenProvider.notifier).setValue(false);
    // ref.invalidate(entityIdProvider);
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthController, AuthState>(
  () => AuthController(),
);
