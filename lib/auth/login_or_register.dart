import 'package:delivoria/pages/login_page.dart';
import 'package:delivoria/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({
    super.key,
  });

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially, we will show the login page
  bool showLoginPage = true;

  // toggle between login and register page
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePage); // Perbaikan nama fungsi
    } else {
      return RegisterPage(onTap: togglePage); // Perbaikan nama fungsi
    }
  }
}