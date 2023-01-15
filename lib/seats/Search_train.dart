import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:ticket_book/dummy.dart';
// import 'package:ticket_book/user_log/check_login.dart';
// import 'package:ticket_book/user_log/home.dart';
//import 'package:ticket_book/seats/Search_train.dart.dart';
//import 'package:ticket_book/user_log/register.dart';
import 'package:intl/intl.dart';

import '../dummy.dart';

class pg1 extends StatefulWidget {
  const pg1({Key? key}) : super(key: key);

  @override
  State<pg1> createState() => _pg1State();
}

class _pg1State extends State<pg1> {
  var d;
  var date_now;
  final user = FirebaseAuth.instance.currentUser!;
  final _fromcontroller = TextEditingController();
  final _tocontroller = TextEditingController();
  final _artimecontroller = TextEditingController();
  final _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var d;
    // var date_now;
    // final user = FirebaseAuth.instance.currentUser!;
    // final _fromcontroller = TextEditingController();
    // final _tocontroller = TextEditingController();
    // final _artimecontroller = TextEditingController();
    // final _date = TextEditingController();
    //final db = FirebaseFirestore.instance;

    /*bool Checks() {
      db.collection("Train_details")
          .where("From", isEqualTo: _fromcontroller.text.trim())
          .get();
    };*/
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        elevation: 0,
        title: const Center(
          child: Text(
            'Train Ticket Booking',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 250, top: 5, bottom: 5),
                  child: Text('Logut'),
                ),
                MaterialButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
                    child: Icon(
                      Icons.logout,
                      size: 35,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ), //LOGOUT ICON-FUNCTION

            const Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'From ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 10, bottom: 10),
              child: TextField(
                controller: _fromcontroller,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.indigo,
                    ),
                  ),
                  hintText: 'Enter the source station',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'To ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ), //to
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 10, bottom: 10),
              child: TextField(
                controller: _tocontroller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.indigo.shade900,
                    ),
                  ),
                  hintText: 'Enter the destination station',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Arrival Time',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ), //arr time
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 10, bottom: 10),
              child: TextField(
                controller: _artimecontroller,
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.access_time,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.indigo.shade900,
                    ),
                  ),
                  hintText: 'Expected time to reach destination',
                ),
                onTap: () async {
                  TimeOfDay? pickartime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  var d1 = pickartime?.hour;
                  d1 = (d1! * 3600000);
                  var d2 = pickartime?.minute;
                  d2 = (d2! * 60000);
                  d = d1 + d2;

                  if (pickartime != null) {
                    String data = pickartime.format(context).toString();
                    setState(() {
                      _artimecontroller.text = data;
                    });
                  } else {}
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Date',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30, right: 23),
              child: TextField(
                controller: _date,
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.indigo.shade900,
                    ),
                  ),
                  hintText: "Date of journey",
                ),
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2024));
                  date_now = pickeddate?.millisecondsSinceEpoch;
                  if (pickeddate != null) {
                    setState(() {
                      _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                    });
                    date_now = date_now + d;
                  } else {}
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => dum(
                          from: _fromcontroller.text.trim(),
                          to: _tocontroller.text.trim(),
                          time: date_now)));
                }, //next page=>>>>pg2
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
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
