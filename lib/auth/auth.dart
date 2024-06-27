import 'package:beauty_bazaar/auth/login_or_register.dart';
import 'package:beauty_bazaar/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// if user signed in, show home page, else show login or register page
// use stream to listen to authentication
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // listen to authentication state changes
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){ // snapshot contain the latest data from the stream
          // user is logged in
          if(snapshot.hasData){
            return const HomePage();
          }

          // user is not logged in
          else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}