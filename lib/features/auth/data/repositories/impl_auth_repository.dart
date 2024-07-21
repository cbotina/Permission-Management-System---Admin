import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pms_admin/common/environment/environment.dart';
import 'package:pms_admin/features/auth/data/abstract_repositories/auth_repository.dart';
import 'package:pms_admin/features/auth/data/dto/login_dto.dart';

class ImplAuthRepository implements IAuthRepository {
  @override
  Future<String> login(LoginDto dto) async {
    final uri = Uri.parse("${ENV.backendUrl}/auth/login");

    final response = await http.post(
      uri,
      body: jsonEncode(dto),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    switch (response.statusCode) {
      case 200:
        return jsonResponse['token'];
      case 401:
        throw Exception('Credenciales invalidas');
      case 404:
        throw Exception('Correo no registrado');
      default:
        throw Exception('Error de servidor, intente más tarde');
    }
  }
}
