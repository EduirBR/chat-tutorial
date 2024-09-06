import 'package:flutter/material.dart';
import 'package:myapp/shared/widgets/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        actions: const [],
      ),
      drawer: const MyDrawer(),
    );
  }
}
