// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart';
import 'package:myapp/themes/theme_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_mock.dart';

void main() {
  // late MockFirebaseAuth mockFirebaseAuth;
  setupFirebaseAuthMocks();
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase
        .initializeApp(); // Initialize Firebase before running any tests
    // mockFirebaseAuth = MockFirebaseAuth();
  });
  testWidgets('GeneralTest', (WidgetTester tester) async {
    // Use the mocked FirebaseAuth instance
    // Render the login screen with a mock Firebase instance
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          // Agrega más proveedores aquí si los necesitas
        ],
        child: const MyApp(),
      ),
    );
  });
}

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());
  // });