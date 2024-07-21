import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/auth/data/providers/valid_token_provider.dart';
import 'package:pms_admin/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_admin/features/auth/presentation/state/auth_state.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  return ref.watch(authControllerProvider).when(
        data: (data) {
          return data.authResult == AuthResult.success &&
              ref.watch(validTokenProvider);
        },
        error: (error, stackTrace) => false,
        loading: () => false,
      );
});
