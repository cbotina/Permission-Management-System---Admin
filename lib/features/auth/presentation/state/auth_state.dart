import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_admin/features/auth/domain/enums/user_role.dart';

part 'auth_state.freezed.dart';

enum AuthResult {
  success,
  failure,
  logout,
}

@freezed
class AuthState with _$AuthState {
  factory AuthState(
    AuthResult authResult,
    int? userId,
    int? periodId,
    UserRole? userRole,
  ) = _AuthState;
}
