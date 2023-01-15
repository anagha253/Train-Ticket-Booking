import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final VoidCallback loginpg;
  const Register({Key? key, required this.loginpg}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailcontroller = TextEditingController();
  final _pswdcontroller = TextEditingController();
  final _checkpswdcontroller = TextEditingController();
  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _age = TextEditingController();

  @override
  Future SignUp() async {
    if (check()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _pswdcontroller.text.trim(),
      );
      addUserDetails(
        _firstname.text.trim(),
        _lastname.text.trim(),
        int.parse(_age.text.trim()),
        _emailcontroller.text.trim(),
      );
    }
  }

  Future addUserDetails(
      String firstname, String lastname, int age, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'firstname': firstname,
      'lastname': lastname,
      'age': age,
      'email': email,
    });
  }

  bool check() {
    if (_pswdcontroller.text.trim() == _checkpswdcontroller.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  void dispose() {
    // TODO: implement dispose
    _emailcontroller.dispose();
    _pswdcontroller.dispose();
    _checkpswdcontroller.dispose();
    _firstname.dispose();
    _lastname.dispose();
    _age.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(top: 30.0, left: 10, bottom: 20),
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: 35,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8),
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50.0, left: 50, right: 50),
                  child: Center(
                    child: Text(
                      "Hi there!! 🤗",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    "Register to book your Train Ticket",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                /*const CircleAvatar(
                  backgroundImage: AssetImage('images/irctc.png'),
                  backgroundColor: Colors.white70,
                  radius: 80,
                ),*/
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    //controller
                    controller: _firstname,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter FirstName",
                    ),
                  ),
                ), //firstname
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    //controller
                    controller: _lastname,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter LastName",
                    ),
                  ),
                ), //lastname
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
                ), //email
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    //controller
                    controller: _age,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Age",
                    ),
                  ),
                ), //age

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
                ), //pswd
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    //controller
                    controller: _checkpswdcontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Re-enter Password",
                    ),
                    obscureText: true,
                  ),
                ), //recheck password
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: SignUp,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade900,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "SignUp",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ), //button(sign-up)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Want to login?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.loginpg,
                      child: const Text(
                        " login",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
