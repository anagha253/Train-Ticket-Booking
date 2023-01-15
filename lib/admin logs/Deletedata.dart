import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbms_proj2/admin%20logs/udatepg.dart';
import 'package:flutter/material.dart';
/*
import 'package:ticket_book/user_log/check_login.dart';
import 'package:ticket_book/admin%20logs/udatepg.dart';*/

class Del extends StatefulWidget {
  const Del({Key? key}) : super(key: key);

  @override
  State<Del> createState() => _DelState();
}

class _DelState extends State<Del> {
  final _tnum = TextEditingController();

  Future del() {
    return FirebaseFirestore.instance
        .collection('Train_Details')
        .doc(_tnum.text.trim())
        .delete()
        .then((value) => print("Deleted"));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tnum.dispose();
    super.dispose();
  }

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
                builder: (BuildContext context) => const Updatepg()));
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 75),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Enter the doc id to be deleted",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              controller: _tnum,
              decoration: InputDecoration(
                  hintText: "Enter Doc-Id", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: GestureDetector(
              onTap: () {
                del();
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Notification'),
                    content: const Text('Train Deleted!!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
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
    );
  }
}
