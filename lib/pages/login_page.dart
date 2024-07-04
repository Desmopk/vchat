import 'package:flutter/material.dart';
import 'package:vchat/auth/auth_service.dart';
import 'package:vchat/component/my_button.dart';
import 'package:vchat/component/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;
  LoginPage({required this.onTap,super.key});
  void login(BuildContext context) async{
  final authService = AuthService();
  try{
    await authService.signInWithEmailPassword(_emailController.text, _pwController.text);
  }
  catch (e){
    showDialog(context: context,builder: (context)=>AlertDialog(title: Text(e.toString())));
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Welcome Back Tarnished!!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),
            MyTextField(
                controller: _emailController,
                hintText: "Email",
                obscureText: false),
            SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: _pwController,
                hintText: "Password",
                obscureText: true),
            SizedBox(
              height: 25,
            ),
            MyButton(
              text: "Login",
              onTap: ()=>login(context),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
