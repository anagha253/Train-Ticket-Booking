import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../user_log/check_login.dart';
//import 'package:ticket_book/user_log/check_login.dart';

class Adlog extends StatefulWidget {
  const Adlog({Key? key}) : super(key: key);

  @override
  State<Adlog> createState() => _AdlogState();
}

class _AdlogState extends State<Adlog> {
  final _emailcontroller = TextEditingController();
  final _pswdcontroller = TextEditingController();

  Future Signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailcontroller.text.trim(),
      password: _pswdcontroller.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.indigo.shade900,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle_sharp,
                color: Colors.white,
                size: 30,
              ),
              title: const Text(
                "Home",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CheckLogin()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.indigo.shade900, size: 30),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8, top: 30),
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40.0, left: 50, right: 50),
                  child: Center(
                    child: Text(
                      "Welcome ",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Center(
                    child: Text(
                      "To",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 70, right: 50),
                  child: Center(
                    child: Text(
                      " Admin login!! 🤗",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Center(
                  // child: Text(
                  //   "Login to book your Train Ticket",
                  //   style: TextStyle(fontSize: 20),
                  // ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage('images/irctc.png'),
                  backgroundColor: Colors.white70,
                  radius: 80,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    //controller
                    controller: _emailcontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter email-Id",
                    ),
                  ),
                ), //phone number
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    //controller
                    controller: _pswdcontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Password",
                    ),
                    obscureText: true,
                  ),
                ), //password
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: Signin,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade900,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ), //button(login)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
