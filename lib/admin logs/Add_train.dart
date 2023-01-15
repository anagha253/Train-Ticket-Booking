import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbms_proj2/admin%20logs/udatepg.dart';
import 'package:flutter/material.dart';
//import 'package:ticket_book/admin%20logs/udatepg.dart';
import 'package:intl/intl.dart';

class Newadd extends StatefulWidget {
  const Newadd({Key? key}) : super(key: key);

  @override
  State<Newadd> createState() => _NewaddState();
}

class _NewaddState extends State<Newadd> {
  DateTime join(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  final _tranum = TextEditingController();
  final _traname = TextEditingController();
  final _from = TextEditingController();
  final _to = TextEditingController();
  final _arrtime = TextEditingController();
  final _atime = TextEditingController();
  final _dtime = TextEditingController();
  final _deptime = TextEditingController();
  final _seatnum = TextEditingController();
  final _key = TextEditingController();
  var date_now;
  var a;
  var d;
  var date_next;

  @override
  void dispose() {
    // TODO: implement dispose
    _arrtime.dispose();
    _atime.dispose();
    _dtime.dispose();
    _deptime.dispose();
    _to.dispose();
    _from.dispose();
    _traname.dispose();
    _tranum.dispose();
    _key.dispose();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(
                "Enter train number",
                style: TextStyle(fontSize: 20),
              ),
            ), //trnum
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: _tranum,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo.shade900,
                      ),
                    ),
                    hintText: "Enter train number"),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 10, top: 30),
              child: Text(
                "Train name",
                style: TextStyle(fontSize: 20),
              ),
            ), //trname
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: _traname,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo.shade900,
                      ),
                    ),
                    hintText: "Enter train name"),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "From",
                style: TextStyle(fontSize: 20),
              ),
            ), //from
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: _from,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo.shade900,
                      ),
                    ),
                    hintText: "Enter from"),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "To",
                style: TextStyle(fontSize: 20),
              ),
            ), //to
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: _to,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo.shade900,
                      ),
                    ),
                    hintText: "Enter destination"),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Number of seats",
                style: TextStyle(fontSize: 20),
              ),
            ), //no of seats
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: _seatnum,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo.shade900,
                      ),
                    ),
                    hintText: "Enter Number of seats"),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Arrival time",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 10, bottom: 10),
              child: TextField(
                controller: _atime,
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
                  hintText: 'arrival time',
                ),
                onTap: () async {
                  TimeOfDay? pickartime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  var a1 = pickartime?.hour;
                  a1 = (a1! * 3600000);
                  var a2 = pickartime?.minute;
                  a2 = (a2! * 60000);
                  a = a1 + a2;

                  if (pickartime != null) {
                    String data = pickartime.format(context).toString();
                    setState(() {
                      _atime.text = data;
                    });
                  } else {}
                },
              ),
            ), //arr date n time
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30, right: 23),
              child: TextField(
                controller: _arrtime,
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
                    lastDate: DateTime(2024),
                  );
                  date_next = pickeddate?.millisecondsSinceEpoch;

                  // print("TTTT:${pickeddate?.millisecondsSinceEpoch}");
                  // print("TTTT:${date_now}");
                  if (pickeddate != null) {
                    String data = DateFormat('dd-MM-yyyy').format(pickeddate);

                    setState(() {
                      _arrtime.text = data;
                    });

                    date_next = date_next + a;
                    print("aaaa:${date_next}");
                  } else {}
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Depature time",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 10, bottom: 10),
              child: TextField(
                controller: _dtime,
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
                  hintText: 'departure time',
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
                      _dtime.text = data;
                    });
                  } else {}
                },
              ),
            ), //dept date n time
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30, right: 23),
              child: TextField(
                controller: _deptime,
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
                    lastDate: DateTime(2024),
                  );
                  date_now = pickeddate?.millisecondsSinceEpoch;

                  // print("TTTT:${pickeddate?.millisecondsSinceEpoch}");
                  //print("TTTT:${date_now}");
                  if (pickeddate != null) {
                    String data = DateFormat('dd-MM-yyyy').format(pickeddate);

                    setState(() {
                      _deptime.text = data;
                    });

                    date_now = date_now + d;
                    //print("aaaa:$date_now");
                  } else {}
                },
              ),
            ), //dept date

            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Key",
                style: TextStyle(fontSize: 20),
              ),
            ), //no of seats
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: _key,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.indigo.shade900,
                      ),
                    ),
                    hintText: "Enter doc-id"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: GestureDetector(
                onTap: () {
                  var key = _key.text.trim();
                  //CollectionReference col=FirebaseFirestore.instance.collection("Train_Details");
                  FirebaseFirestore.instance
                      .collection("Train_Details")
                      .doc(key)
                      .set({
                    'From': _from.text.trim(),
                    "To": _to.text.trim(),
                    'Train_name': _traname.text.trim(),
                    'Train_num': int.parse(_tranum.text.trim()),
                    'number_seats': int.parse(_seatnum.text.trim()),
                    'Departure_time': date_now,
                    'Arrival_time': date_next,
                    'key': key,
                  });
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Notification'),
                      content: const Text('New Train Added!!'),
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
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Add",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ), //add
          ],
        ),
      ),
    );
  }
}
