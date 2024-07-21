import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/auth/domain/enums/user_role.dart';
import 'package:pms_admin/features/auth/presentation/controllers/auth_controller.dart';

final roleProvider = Provider<UserRole?>((ref) {
  return ref.watch(authControllerProvider).when(
        data: (data) {
          return data.userRole;
        },
        error: (error, stackTrace) => null,
        loading: () => null,
      );
});
