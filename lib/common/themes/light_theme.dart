import 'package:flutter/material.dart';
import 'package:pms_admin/common/themes/color_schemes/light_colors.dart';

final lightTheme = ThemeData(
  useMaterial3: false,
  fontFamily: 'PlusJakartaSans',
  colorScheme: lightColorScheme,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    toolbarHeight: 45,
  ),
  drawerTheme: const DrawerThemeData(
    width: 250,
    elevation: 3,
  ),
  // textTheme: const TextTheme(
  //   displaySmall: TextStyle(
  //     fontWeight: FontWeight.bold,
  //     fontFamily: 'Roboto',
  //   ),
  // ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //     elevation: const WidgetStatePropertyAll(3),
  //     overlayColor: const WidgetStatePropertyAll(
  //       Colors.blueAccent,
  //     ),
  //     backgroundColor: WidgetStatePropertyAll(
  //       lightColorScheme.primary,
  //     ),
  //     foregroundColor: WidgetStatePropertyAll(
  //       lightColorScheme.onPrimary,
  //     ),
  //     padding: const WidgetStatePropertyAll(
  //       EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  //     ),
  //     shape: WidgetStatePropertyAll(
  //       RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //     ),
  //   ),
  // ),
  // textButtonTheme: TextButtonThemeData(
  //   style: ButtonStyle(
  //     elevation: const WidgetStatePropertyAll(0),
  //     backgroundColor: WidgetStatePropertyAll(
  //       Colors.blue.shade100,
  //     ),
  //     foregroundColor: WidgetStatePropertyAll(lightColorScheme.primary),
  //     overlayColor: const WidgetStatePropertyAll(Colors.white),
  //     padding: const WidgetStatePropertyAll(
  //       EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  //     ),
  //     shape: WidgetStatePropertyAll(
  //       RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //     ),
  //   ),
  // ),
  scaffoldBackgroundColor: lightColorScheme.surface,
  // iconButtonTheme: IconButtonThemeData(
  //   style: ButtonStyle(
  //     foregroundColor: WidgetStatePropertyAll(Colors.grey.shade700),
  //   ),
  // ),
  // shadowColor: Colors.black.withOpacity(.3),
  // appBarTheme: const AppBarTheme(
  //   elevation: 0,
  //   foregroundColor: Colors.white,
  //   iconTheme: IconThemeData(
  //     color: Colors.white,
  //   ),
  // ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 3,
    shadowColor: Colors.black,
  ),
  // cardTheme: CardTheme(
  //   elevation: 13,
  //   shadowColor: Colors.black,
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(15),
  //   ),
  // ),
);
