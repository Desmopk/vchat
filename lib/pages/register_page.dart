import 'package:flutter/material.dart';
import 'package:vchat/auth/auth_service.dart';

import '../component/my_button.dart';
import '../component/my_textfield.dart';
class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final void Function()? onTap;
   RegisterPage({required this.onTap,super.key});
   void register(BuildContext context){
     final _auth = AuthService();
     if(_pwController.text == _confirmPwController.text){
       try{
         _auth.signUpWithEmailPassword(_emailController.text, _pwController.text);
       }catch (e){
         showDialog(context: context, builder: (context)=> AlertDialog(title: Text(e.toString()),));
       }
     }
     else{
       showDialog(context: context, builder: (context)=>AlertDialog(title: Text("Passwords don't match"),));
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
              "Lets Create an account",
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
            SizedBox(height: 10,),
            MyTextField(
                controller: _confirmPwController,
                hintText: "Confirm Password",
                obscureText: true),
            SizedBox(
              height: 25,
            ),
            MyButton(
              text: "Register now",
              onTap: ()=>register(context),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(onTap: onTap,
                  child: Text(
                    "Login now",
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
