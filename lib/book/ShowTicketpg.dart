import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:ticket_book/user_log/check_login.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../user_log/check_login.dart';

class ShowTicketpg extends StatefulWidget {
  String from;
  String to;
  int time;
  final user;
  final seat_num;
  final amount;

  ShowTicketpg({
    super.key,
    required this.from,
    required this.to,
    required this.time,
    required this.user,
    required this.amount,
    required this.seat_num,
  });

  @override
  State<ShowTicketpg> createState() => _ShowTicketpgState();
}

class _ShowTicketpgState extends State<ShowTicketpg> {
  late String from = widget.from;
  late String to = widget.to;
  late int time = widget.time;
  late var date1 = DateTime.fromMillisecondsSinceEpoch(time, isUtc: false);

  // prints() {
  //   print(time);
  //   print(DateTime.fromMillisecondsSinceEpoch(time, isUtc: false));
  //   // date1 = DateTime.fromMicrosecondsSinceEpoch(time, isUtc: false);
  //   // print(date1);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: const Padding(
          padding: EdgeInsets.only(left: 70.0),
          child: Text(
            "Your Ticket!!",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 28, top: 28),
        child: TicketWidget(
          color: Colors.indigo,
          width: 325,
          height: 500,
          isCornerRounded: true,
          padding: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // GestureDetector(
                //   child: Text("check"),
                //   onTap: prints,
                // ),
                const Text(
                  "Ticket",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "From: $from",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 45),
                  child: Text(
                    "To: $to",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Text(
                  "Arrival at: ${DateTime.fromMillisecondsSinceEpoch(time, isUtc: false)}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>
                          const CheckLogin()));
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.indigo.shade900),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
