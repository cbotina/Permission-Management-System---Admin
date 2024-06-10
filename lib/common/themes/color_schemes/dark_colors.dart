import 'package:flutter/material.dart';

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Colors.tealAccent,
  onPrimary: Color.fromARGB(255, 0, 0, 0),
  secondary: Colors.black, // ribbon
  onSecondary: Color(0xff0e0e0e),
  tertiary: Color.fromARGB(255, 132, 255, 243),
  onTertiary: Colors.black,
  error: Color(0xffe6202d),
  onError: Colors.white,
  primaryContainer: Colors.white,
  onPrimaryContainer: Color.fromARGB(255, 245, 245, 245),

  secondaryContainer: Colors.white, // google
  onSecondaryContainer: Color.fromARGB(255, 18, 18, 18),
  tertiaryContainer: Color(0xff486CB4), //facebook
  onTertiaryContainer: Colors.white,

  surface: Color(0xff0F131D),
  onSurface: Color.fromARGB(255, 255, 255, 255),
  surfaceContainerHighest: Color(0xff1A1B27),
  scrim: Colors.transparent,

  outline: Colors.transparent,
);
