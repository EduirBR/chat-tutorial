import 'package:flutter/material.dart';
import 'package:myapp/auth/pages/login_page.dart';
import 'package:myapp/auth/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: showLoginPage
            ? LoginPage(
                toggleScreen: togglePages,
              )
            : RegisterPage(
                toggleScreen: togglePages,
              ));
  }
}
