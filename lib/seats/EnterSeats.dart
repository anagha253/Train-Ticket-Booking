import 'package:flutter/material.dart';
// import 'package:ticket_book/book/book_seat.dart';
// import 'package:ticket_book/book/ticketpay.dart';
// import 'package:ticket_book/seats/Search_train.dart';

import '../book/ticketpay.dart';
import 'Search_train.dart';

class Enterseat extends StatefulWidget {
  String from;
  String to;
  int time;
  int num;
  String name;
  Enterseat(
      {Key? key,
        required this.num,
        required this.name,
        required this.time,
        required this.to,
        required this.from})
      : super(key: key);

  @override
  State<Enterseat> createState() => _EnterseatState();
}

class _EnterseatState extends State<Enterseat> {
  final _seat = TextEditingController();
  late int val;

  int check() {
    print("bbbb:${int.parse(_seat.text.trim())}");
    print("cccc:${widget.num}");
    if (widget.num >= int.parse(_seat.text.trim())) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _seat.dispose();
    super.dispose();
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 30,
              bottom: 30,
            ),
            child: Center(
              child: Text(
                'Enter the total number of passengers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: TextField(
              controller: _seat,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.indigo.shade900,
                    ),
                  ),
                  hintText: "Passenger number"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: GestureDetector(
              onTap: () {
                int i = check();
                if (i == 1) {
                  val = int.parse(_seat.text.trim());
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Ticketpay(
                          from: widget.from,
                          to: widget.to,
                          time: widget.time,
                          num: val,
                          tname: widget.name,
                          seat: widget.num)));
                } else {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Notification'),
                      content: const Text('No seats available'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigo.shade900,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Book",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
