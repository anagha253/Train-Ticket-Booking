import 'package:dbms_proj2/admin%20logs/udatepg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'admincheck.dart';
import 'nextpg.dart';
/*import 'package:ticket_book/admin%20logs/admincheck.dart';
import 'package:ticket_book/admin%20logs/nextpg.dart';
import 'package:ticket_book/admin%20logs/udatepg.dart';*/

class Adminpg extends StatefulWidget {
  const Adminpg({Key? key}) : super(key: key);

  @override
  State<Adminpg> createState() => _AdminpgState();
}

class _AdminpgState extends State<Adminpg> {
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
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => Check()));
          },
          child: const Icon(
            Icons.logout,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 22),
            child: const Center(
              child: Text(
                "Wanna make changes with train schedule? ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
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
                        builder: (BuildContext context) => const Updatepg()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade900,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const Nextpg()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade900,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        " No",
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
