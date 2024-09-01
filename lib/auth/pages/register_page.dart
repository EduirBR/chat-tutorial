import 'package:flutter/material.dart';
import 'package:myapp/shared/widgets/my_botton.dart';
import 'package:myapp/shared/widgets/my_texfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final void Function()? toggleScreen;
  RegisterPage({super.key, this.toggleScreen});

  //register method
  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            //wbtext
            Text(
              "Wb you've been missed",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //email field
            MyTexField(
              hintText: 'email',
              controller: _emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            //password field
            MyTexField(
              hintText: 'password',
              oscureText: true,
              controller: _passwordController,
            ),
            //login
            const SizedBox(
              height: 10,
            ),
            MyTexField(
              hintText: 'confirm password',
              oscureText: true,
              controller: _confirmPasswordController,
            ),
            //login
            const SizedBox(
              height: 10,
            ),
            MyButton(
              text: 'Register',
              onTap: register,
            ),
            //Register
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                ),
                GestureDetector(
                  onTap: toggleScreen,
                  child: const Text(
                    'Login Now',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
