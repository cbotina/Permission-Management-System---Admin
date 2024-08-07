import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pms_admin/common/constants/strings.dart';
import 'package:pms_admin/common/providers/active_period_provider.dart';
import 'package:pms_admin/common/providers/repository_providers.dart';
import 'package:pms_admin/features/auth/data/abstract_repositories/auth_repository.dart';
import 'package:pms_admin/features/auth/data/dto/login_dto.dart';
import 'package:pms_admin/features/auth/domain/enums/user_role.dart';
import 'package:pms_admin/features/auth/presentation/state/auth_state.dart';
import 'package:pms_admin/features/navigation/navigation_providers.dart';
import 'package:pms_admin/features/periods/data/abstract_repositories/periods_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final IAuthRepository _authRepository;
  final IPeriodsRepository _periodsRepository;
  final ProviderRef ref;

  AuthService({
    required IAuthRepository authRepository,
    required IPeriodsRepository periodsRepository,
    required this.ref,
  })  : _authRepository = authRepository,
        _periodsRepository = periodsRepository;

  Future<AuthState> login(LoginDto dto) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await _authRepository.login(dto);

    await prefs.setString('token', token);

    final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    log(decodedToken.toString());
    final int userId = decodedToken['id'];
    final UserRole role = decodedToken['role'].toString().toUserRole();

    final period = await _periodsRepository.getActivePeriod();

    ref.read(activePeriodProvider.notifier).setPeriod(period!); // ojito
    ref.read(selectedPageNameProvider.notifier).setPage(Strings.periods);

    final result = AuthState(AuthResult.success, userId, period.id, role);

    return result;
  }

  Future<AuthState> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    return Future.value(AuthState(AuthResult.logout, null, null, null));
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    authRepository: ref.watch(authRepositoryProvider),
    periodsRepository: ref.watch(periodsRepositoryProvider),
    ref: ref,
  );
});
