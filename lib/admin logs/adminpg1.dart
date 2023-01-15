import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
/*import 'package:ticket_book/admin%20logs/admincheck.dart';
import 'package:ticket_book/admin%20logs/adminpg.dart';

import 'package:ticket_book/user_log/check_login.dart';*/

import 'admincheck.dart';
import 'adminpg.dart';

class Adminpg1 extends StatefulWidget {
  const Adminpg1({Key? key}) : super(key: key);

  @override
  State<Adminpg1> createState() => _Adminpg1State();
}

class _Adminpg1State extends State<Adminpg1> {
  final _key = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Train Ticket Booking"),
        ),
        backgroundColor: Colors.indigo.shade900,
        elevation: 1,
        leading: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
            MaterialStatePropertyAll<Color>(Colors.indigo.shade900),
          ),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const Check()));
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Enter admin key",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter key",
              ),
              controller: _key,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (int.parse(_key.text.trim()) == 1236) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => const Adminpg()));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.indigo.shade900,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
