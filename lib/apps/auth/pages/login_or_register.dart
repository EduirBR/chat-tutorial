import 'package:flutter/material.dart';
import 'package:myapp/apps/auth/pages/login_page.dart';
import 'package:myapp/apps/auth/pages/register_page.dart';
import 'package:myapp/themes/theme_provider.dart';
import 'package:provider/provider.dart';

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
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme(),
                icon: Provider.of<ThemeProvider>(context, listen: false)
                        .isDarkMode
                    ? const Icon(Icons.dark_mode)
                    : Icon(
                        Icons.light_mode,
                        color: Theme.of(context).colorScheme.primary,
                      ))
          ],
        ),
        body: showLoginPage
            ? LoginPage(
                toggleScreen: togglePages,
              )
            : RegisterPage(
                toggleScreen: togglePages,
              ));
  }
}
