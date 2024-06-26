import 'package:beauty_bazaar/components/my_button.dart';
import 'package:beauty_bazaar/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beauty_bazaar/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login method
  void login() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // try signing in
    try {
      // sign in the user
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop loading circle
      Navigator.pop(context);

      // show error message to user
      displayMessageToUser(e.code, context);
    }
  }

  // forgot password method
  void forgotPassword() async {
    String email = "";

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Forgot Password"),
        content: TextField(
          decoration: const InputDecoration(hintText: "Enter your email"),
          onChanged: (value) {
            email = value;
          },
        ),
        actions: [
          // cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          // reset button
          TextButton(
            onPressed: () async {
              if (email.isNotEmpty) {
                try {
                  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                  Navigator.pop(context);
                  displayMessageToUser("Password reset email sent", context);
                } on FirebaseAuthException catch (e) {
                  displayMessageToUser(e.code, context);
                }
              }
            },
            child: const Text("Reset"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 25.0,
            right: 25.0,
            top: 25.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 25.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/images/logo.png'),
              
              const SizedBox(height: 50),

              // email textfield
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),

              const SizedBox(height: 10),

              /// forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: forgotPassword,
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                text: "LOGIN",
                onTap: login,
              ),

              const SizedBox(height: 25),

              // don't have an account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
