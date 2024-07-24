import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/common/themes/light_theme.dart';
import 'package:pms_admin/features/auth/data/providers/is_logged_in.dart';
import 'package:pms_admin/features/auth/data/providers/role_provider.dart';
import 'package:pms_admin/features/auth/domain/enums/user_role.dart';
import 'package:pms_admin/pages/login_page.dart';
import 'package:pms_admin/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await dotenv.load();

  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // final testToken = dotenv.get('token');

  // await prefs.setString('token', testToken);

  Intl.defaultLocale = 'es_ES';
  initializeDateFormatting('es_ES', null).then((_) {
    runApp(const ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
      ],
      title: 'Sistema Gestor de Permisos - PFC',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: Consumer(
        builder: (context, ref, child) {
          final isLoggedIn = ref.watch(isLoggedInProvider);
          final userRole = ref.watch(roleProvider);

          if (isLoggedIn && userRole != null) {
            switch (userRole) {
              case UserRole.admin:
              case UserRole.secretary:
                return const MainPage();
              default:
                return const LoginPage();
            }
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
