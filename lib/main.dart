import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chatcito/apps/auth/pages/auth_gate.dart';
import 'package:chatcito/firebase_options.dart';
import 'package:chatcito/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      // Agrega más proveedores aquí si los necesitas
    ],
    child: const chatcito(),
  ));
}

class chatcito extends StatelessWidget {
  const chatcito({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
