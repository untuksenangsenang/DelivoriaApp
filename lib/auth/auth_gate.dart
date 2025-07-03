import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // ⬅ Wajib diimpor
import 'package:delivoria/pages/home_page.dart'; // ✅ Ganti dari fooddelivtute ke delivoria
import 'package:delivoria/auth/login_or_register.dart'; // ✅ Ganti dari fooddelivtute ke delivoria

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            return const HomePage();
          }

          // User is not logged in
          else {
            return const LoginOrRegister(); // ✅ Sesuaikan nama class
          }
        },
      ),
    );
  }
}
