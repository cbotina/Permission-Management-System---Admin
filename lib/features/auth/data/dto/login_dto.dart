import 'dart:collection';

class LoginDto extends MapView<String, dynamic> {
  final String username;
  final String password;

  LoginDto({required this.username, required this.password})
      : super({
          "username": username,
          "password": password,
        });
}
