import 'package:flutter/material.dart';
import 'package:myapp/auth/pages/login_or_register.dart';
import 'package:myapp/themes/light_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: lightMode,
    );
  }
}
