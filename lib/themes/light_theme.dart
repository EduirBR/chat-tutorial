import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
      surface: Colors.grey.shade300,
      primary: Colors.grey.shade500,
      secondary: Colors.grey.shade200,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade900),
  textTheme: TextTheme(
    bodyLarge: const TextStyle(color: Colors.grey), // Texto normal
    bodyMedium: TextStyle(color: Colors.grey.shade500), // Texto secundario
    displayLarge: const TextStyle(color: Colors.black), // Títulos grandes
    displayMedium: const TextStyle(color: Colors.black), // Títulos medianos
    // Puedes agregar más estilos según sea necesario
  ),
);
