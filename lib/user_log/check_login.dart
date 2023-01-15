import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//import 'package:ticket_book/user_log/auth.dart';
//import 'package:ticket_book/seats/Search_train.dart';

import '../seats/Search_train.dart';
import 'auth.dart';

class CheckLogin extends StatelessWidget {
  const CheckLogin({Key? key}) : super(key: key);

  // #1method
  // authacc(BuildContext context) {
  //   FirebaseAuth.instance.currentUser().then((user) {
  //     FirebaseFirestore.instance.collection('user').getDocuments().then((docs) {
  //       if (docs.documents[0].exists) {
  //         if (docs.documents[0].data['role'] == 'admin') {
  //           Navigator.of(context).push(new MaterialPageRoute(
  //               builder: (BuildContext) => const Adminpg()));
  //         }
  //       }
  //     });
  //   });
  // }
  // bool role(User){
  //   if (FirebaseAuth.instance.currentUser)
  // }
  //#2method
  // Future<User?> getuser() async{
  //   if(FirebaseAuth.instance!= null)
  //     {
  //       final User? user = FirebaseAuth.instance.currentUser;
  //       return user;
  //     }
  //   return null;
  // }
  //
  //
  // @override
  // void initState(BuildContext context) {
  //   //super.initState();
  //   Future.delayed(Duration.zero, () async {
  //     final User? user = await getuser();
  //     if (user != null) {
  //         var data = await FirebaseFirestore.instance
  //             .collection('users')
  //             .doc(user.uid)
  //             .get();
  //
  //         if (data.data()!['admin']== true) {
  //           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const Adminpg()));
  //         } else {
  //           Navigator.of(context).pushReplacement(
  //               MaterialPageRoute(builder: (context) => const pg1()));
  //         }
  //       }
  //     else {
  //         Navigator.of(context).pushReplacement(
  //             MaterialPageRoute(builder: (context) => const auth()));
  //       }
  //     };

  @override
  Widget build(BuildContext context) {
    //final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return const pg1();
            } else {
              return const auth();
            }
          }),
    );
  }
}
