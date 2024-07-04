import 'package:flutter/material.dart';
import 'package:vchat/auth/auth_gate.dart';
import 'package:vchat/auth/login_register.dart';
import 'package:vchat/firebase_options.dart';
import 'package:vchat/pages/login_page.dart';
import 'package:vchat/pages/register_page.dart';
import 'package:vchat/themes/darkswell.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: Darkswell,
    );
  }
}
