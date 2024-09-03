import 'package:flutter/material.dart';
import 'package:myapp/shared/widgets/my_botton.dart';
import 'package:myapp/shared/widgets/my_texfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  final void Function()? toggleScreen;

  LoginPage({super.key, this.toggleScreen});

  //login method
  void login() {}

  @override
  Widget build(BuildContext context) {
    return Center(
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
          //login
          const SizedBox(
            height: 10,
          ),
          MyButton(
            text: 'Login',
            onTap: login,
          ),
          //Register
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Not a member? ',
              ),
              GestureDetector(
                onTap: toggleScreen,
                child: const Text(
                  'Register Now',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
