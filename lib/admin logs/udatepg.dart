import 'package:flutter/material.dart';
/*
import 'package:ticket_book/admin%20logs/Add_train.dart';
import 'package:ticket_book/admin%20logs/Deletedata.dart';
import 'package:ticket_book/admin%20logs/adminpg.dart';*/

import 'Add_train.dart';
import 'Deletedata.dart';
import 'adminpg.dart';

class Updatepg extends StatefulWidget {
  const Updatepg({Key? key}) : super(key: key);

  @override
  State<Updatepg> createState() => _UpdatepgState();
}

class _UpdatepgState extends State<Updatepg> {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 75),
            const Padding(
              padding: EdgeInsets.only(left: 98.0),
              child: Text(
                "To add new train schedule",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Newadd()));
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Add",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 98.0),
              child: Text(
                "To Delete a train schedule",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 88.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Del()));
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Delete",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
