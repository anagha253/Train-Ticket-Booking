//import 'package:dbms_proj2/book/ticketpay.dart';
import 'package:dbms_proj2/book/ticketpay.dart';
import 'package:flutter/material.dart';
/*
import 'package:ticket_book/book/ticketpay.dart';
import 'package:ticket_book/seats/EnterSeats.dart';
import 'package:ticket_book/seats/Search_train.dart';*/

import '../seats/Search_train.dart';

class Bookseats extends StatefulWidget {
  int num;

  Bookseats({required this.num});

  @override
  State<Bookseats> createState() => _BookseatsState();
}

class _BookseatsState extends State<Bookseats> {
  void p() {
    print("dddd: ${widget.num}");
  }

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
            p();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                "Enter Passenger details",
                style: TextStyle(fontSize: 20),
              ),
            ),
            //display(context),
            Padding(
              padding: const EdgeInsets.only(right: 208.0),
              child: Text("Enter name: ", style: TextStyle(fontSize: 25)),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.indigo.shade900,
                      ),
                    ),
                    hintText: "Enter name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 230.0),
              child: Text("Enter age: ", style: TextStyle(fontSize: 25)),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.indigo.shade900,
                      ),
                    ),
                    hintText: "Enter age"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 108.0),
              child: Text(
                "Enter seat preference: ",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.indigo.shade900,
                      ),
                    ),
                    hintText: "Enter seat preference"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //     builder: (BuildContext context) => Ticketpay()));
                }, //
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'book',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ), //book
          ],
        ),
      ),
    );
  }
}
