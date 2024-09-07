import 'package:flutter/material.dart';

class MyTexField extends StatelessWidget {
  final bool oscureText;
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  const MyTexField(
      {super.key,
      required this.hintText,
      this.oscureText = false,
      required this.controller,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        focusNode: focusNode,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
        obscureText: oscureText,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          )),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
