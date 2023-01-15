import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:ticket_book/admin%20logs/Adminlogin.dart';
//import 'package:ticket_book/admin%20logs/adminpg1.dart';

import 'Adminlogin.dart';
import 'adminpg1.dart';

class Check extends StatelessWidget {
  const Check({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return const Adminpg1();
            } else {
              return const Adlog();
            }
          }),
    );
  }
}
