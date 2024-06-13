import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/common/themes/light_theme.dart';
import 'package:pms_admin/pages/main_page.dart';

void main() async {
  await dotenv.load();

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
      home: const MainPage(),
    );
  }
}
