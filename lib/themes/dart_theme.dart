import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: const Color.fromARGB(255, 212, 212, 212),
      secondary: const Color.fromARGB(255, 53, 53, 53),
      tertiary: Colors.grey.shade800,
      inversePrimary: Colors.grey.shade300),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.grey.shade600), // Texto normal
    bodyMedium: TextStyle(color: Colors.grey.shade500), // Texto secundario
    displayLarge: const TextStyle(color: Colors.black), // Títulos grandes
    displayMedium: const TextStyle(color: Colors.black), // Títulos medianos
    // Puedes agregar más estilos según sea necesario
  ),
);
