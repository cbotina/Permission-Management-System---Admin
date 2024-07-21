import 'package:pms_admin/features/auth/data/dto/login_dto.dart';

abstract class IAuthRepository {
  Future<String> login(LoginDto dto);
}
