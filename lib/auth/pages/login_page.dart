import 'package:flutter/material.dart';
import 'package:myapp/shared/widgets/my_botton.dart';
import 'package:myapp/shared/widgets/my_texfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

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
            SizedBox(
              height: 20,
            ),
            //email field
            MyTexField(
              hintText: 'email',
              controller: _emailcontroller,
            ),
            const SizedBox(
              height: 10,
            ),
            //password field
            MyTexField(
              hintText: 'password',
              oscureText: true,
              controller: _passwordcontroller,
            ),
            //register
// Suggested code may be subject to a license. Learn more: ~LicenseLog:141167233.
            const SizedBox(
              height: 10,
            ),
            MyButton(
              text: 'Login',
            )
          ],
        ),
      ),
    );
  }
}
