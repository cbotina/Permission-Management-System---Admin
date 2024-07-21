import 'package:pms_admin/features/auth/data/abstract_repositories/auth_repository.dart';
import 'package:pms_admin/features/auth/data/dto/login_dto.dart';

class MockAuthRepository implements IAuthRepository {
  @override
  Future<String> login(LoginDto dto) async {
    return 'token';
  }
}
