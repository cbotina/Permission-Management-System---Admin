import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/features/auth/data/abstract_repositories/auth_repository.dart';
import 'package:pms_admin/features/auth/data/dto/login_dto.dart';
import 'package:pms_admin/features/auth/domain/enums/user_role.dart';
import 'package:pms_admin/features/auth/presentation/state/auth_state.dart';
import 'package:pms_admin/features/periods/data/abstract_repositories/periods_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final IAuthRepository _authRepository;
  final IPeriodsRepository _periodsRepository;

  AuthService(
      {required IAuthRepository authRepository,
      required IPeriodsRepository periodsRepository})
      : _authRepository = authRepository,
        _periodsRepository = periodsRepository;

  Future<AuthState> login(LoginDto dto) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await _authRepository.login(dto);
    await prefs.setString('token', token);

    final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    final int userId = decodedToken['id'];
    final int entityId = decodedToken['entityId'];
    final UserRole role = decodedToken['role'].toString().toUserRole();

    log(decodedToken.toString());

    final period = await _periodsRepository.getActivePeriod();

    return AuthState(AuthResult.success, userId, entityId, period!.id, role);
  }

  Future<AuthState> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    return Future.value(AuthState(AuthResult.logout, null, null, null, null));
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    authRepository: ref.watch(authRepositoryProvider),
    periodsRepository: ref.watch(periodsRepositoryProvider),
  );
});
