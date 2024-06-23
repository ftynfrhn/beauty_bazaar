import 'package:beauty_bazaar/auth/auth.dart';
import 'package:beauty_bazaar/auth/login_or_register.dart';
import 'package:beauty_bazaar/firebase_options.dart';
import 'package:beauty_bazaar/pages/home_page.dart';
import 'package:beauty_bazaar/pages/profile_page.dart';
import 'package:beauty_bazaar/theme/default_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(), // firstly listen if we already signed in or not
      theme: defaultMode,
      routes: {
        '/login_register_page': (context) => const LoginOrRegister(),
        '/home_page': (context) => const HomePage(),
        '/profile_page': (context) => const ProfilePage(),
      },
    );
  }
}
