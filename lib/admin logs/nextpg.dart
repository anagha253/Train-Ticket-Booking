import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
/*
import 'package:ticket_book/admin%20logs/admincheck.dart';
import 'package:ticket_book/admin%20logs/adminpg.dart';
import 'package:ticket_book/user_log/home.dart';
import 'package:ticket_book/seats/Search_train.dart';
import 'package:ticket_book/admin%20logs/udatepg.dart';*/

import '../seats/Search_train.dart';
import 'admincheck.dart';
import 'adminpg.dart';

class Nextpg extends StatefulWidget {
  const Nextpg({Key? key}) : super(key: key);

  @override
  State<Nextpg> createState() => _NextpgState();
}

class _NextpgState extends State<Nextpg> {
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
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const Adminpg()));
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 22),
            child: Center(
              child: Text(
                "Wanna book a train?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const pg1()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade900,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0, top: 10, left: 18, right: 18),
                      child: Text(
                        "yes",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const Check()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade900,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        " logout",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
