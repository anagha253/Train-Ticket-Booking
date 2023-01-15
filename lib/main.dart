import 'package:dbms_proj2/user_log/check_login.dart';
import 'package:flutter/material.dart';
//import 'package:ticket_book/user_log/check_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'user_log/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckLogin(),
    );
  }
}
