import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/common/themes/light_theme.dart';
import 'package:pms_admin/pages/main_page.dart';

void main() {
  Intl.defaultLocale = 'es_ES';
  initializeDateFormatting('es_ES', null);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema Gestor de Permisos - PFC',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const MainPage(),
    );
  }
}
