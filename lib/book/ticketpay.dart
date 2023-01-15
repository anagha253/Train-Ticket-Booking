//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../seats/Search_train.dart';
import 'ShowTicketpg.dart';
//import 'package:ticket_book/book/ShowTicketpg.dart';
////import 'package:ticket_book/book/book_seat.dart';
//import 'package:ticket_book/seats/Search_train.dart';
//import 'package:ticket_book/user_log/check_login.dart';

class Ticketpay extends StatefulWidget {
  String from;
  String to;
  int time;
  int num;
  String tname;
  int seat;

  Ticketpay(
      {super.key,
        required this.num,
        required this.tname,
        required this.seat,
        required this.time,
        required this.from,
        required this.to});

  @override
  State<Ticketpay> createState() => _TicketpayState();
}

class _TicketpayState extends State<Ticketpay> {
  late int val = (widget.num);
  final user = FirebaseAuth.instance.currentUser?.email;

  //var date;

  // DateTime conv(int a) {
  //   var date1 = DateTime.fromMicrosecondsSinceEpoch(a, isUtc: false);
  //
  //   return date1;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        leading: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
            MaterialStatePropertyAll<Color>(Colors.indigo.shade900),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => pg1()));
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 70),
            child: Text(
              "Total passengers: ${widget.num}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 70),
            child: Text(
              "Total amount to be paid is ${val * 100}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20, left: 70),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.indigo.shade900,
                ),
                child: GestureDetector(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Pay",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  onTap: () {
                    FirebaseFirestore.instance.collection("Transaction").add({
                      "num_ticket": widget.num,
                      "amount_paid": widget.num * 100,
                      "user": user,
                    });

                    //final DateTime date1 = conv();

                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Notification'),
                        content: const Text('Booked'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              // Navigator.pushReplacement(context, 'OK');
                              // FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ShowTicketpg(
                                            from: widget.from,
                                            to: widget.to,
                                            user: user,
                                            time: widget.time,
                                            seat_num: widget.num,
                                            amount: widget.num * 100,
                                          )));
                            },
                          ),
                        ],
                      ),
                    );
                    // DocumentReference db = FirebaseFirestore.instance
                    //     .collection("Train_details")
                    //     .doc();
                    FirebaseFirestore.instance
                        .collection("Train_Details")
                        .doc(widget.tname)
                        .update({"number_seats": widget.seat - widget.num});

                    // var doc_id2=doc_ref.documentID;
                  },
                ),
              )),
        ],
      ),
    );
  }
}
