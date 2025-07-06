import 'package:delivoria/components/my_button.dart';
import 'package:delivoria/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:delivoria/auth/auth_service.dart';


class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  //register method 
void register() async {
  //get auth service
  final _authService = AuthService();

  //check if password match -> create user
  if (passwordController.text == confirmPasswordController.text){
    //try creating user
    try{
      await _authService.signUpWithEmailPassword(emailController.text, passwordController.text);
    }

    //display any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      ); // 
    }
  }

  // if password don't match -> show error
  else {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("password don't match!"),
      ),
    ); // 
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Image.asset(
              "lib/images/logo/delivoria.png",
              width: 180,
              height: 180,
            ),

            const SizedBox(height: 25),

            // message app slogan
            Text(
              "Let's Create Your Account",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            // email text field
            MyTextfield(
              controller: emailController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: "Email",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0), // Use a neutral color for the border
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2.0,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // password text field
            MyTextfield(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2.0,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // confirm password text field
            MyTextfield(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2.0,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // sign up button
            MyButton(
              onTap: register, 
              text: "Sign Up",
            ),

            const SizedBox(height: 25),

            // already have an account?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}