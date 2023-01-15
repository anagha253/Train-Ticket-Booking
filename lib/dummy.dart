import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbms_proj2/seats/EnterSeats.dart';
import 'package:dbms_proj2/seats/Search_train.dart';
import 'package:flutter/material.dart';
// import 'package:ticket_book/seats/EnterSeats.dart';
// import 'package:ticket_book/seats/Search_train.dart';

class dum extends StatefulWidget {
  String from, to;
  int time;

  dum(
      {required this.from,
      required this.to,
      required this.time}); // const dum({Key? key}) : super(key: key);

  @override
  State<dum> createState() => _dumState();
}

class _dumState extends State<dum> {
  late TextEditingController _from;
  late TextEditingController _to;
  late Stream<QuerySnapshot<Map<String, dynamic>>> train;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _from = TextEditingController(text: widget.from);
    _to = TextEditingController(text: widget.to);
    var f = _from.text.trim();
    var to = _to.text.trim();
    train = FirebaseFirestore.instance
        .collection("Train_Details")
        .where('To', isEqualTo: to)
        .where('From', isEqualTo: f)
        .where('Arrival_time', isEqualTo: widget.time)
        .snapshots();
    int nums;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        leading: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(Colors.indigo.shade900),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const pg1()));
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text("Ticket booking app"),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: StreamBuilder(
            stream: train,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: snapshot.data?.docs.map((doc) {
                    int nums = doc['number_seats'];
                    //print("aaaaa:${nums}");
                    return Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Card(
                        color: Colors.indigo.shade500,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(
                                Icons.train,
                                color: Colors.white,
                              ),
                              title: Text(
                                doc['Train_name'],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  child: const Text(
                                    'Book',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    String a = doc['key'];
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Enterseat(
                                                  from: widget.from,
                                                  to: widget.to,
                                                  time: widget.time,
                                                  num: nums,
                                                  name: a,
                                                )));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList()
                      as List<Widget>, // all the children is making an error
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     counter++;
      //     counterController.sink.add(counter);
      //   },
      //   child: Icon(Icons.add),
    );
  }
}
