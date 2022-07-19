// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final FirebaseFirestore _firestoree = FirebaseFirestore.instance;
  static final _CollectionReference =
      _firestoree.collection("User").doc("USerInfo").collection("Profile");
  static final _DocumentReference = _CollectionReference.doc("ProfileInfo");

//Function 1
  AddUser() async {
    print("object");
    Map<String, dynamic> adduser = {
      "name": "qwerty",
      "roll": 1234567890,
      "mail": "asdfgh2zxcvb",
      "dob": 098765,
    };
    _DocumentReference.set(adduser).whenComplete(() =>
        Fluttertoast.showToast(msg: "User Added").onError((error, stackTrace) =>
            Fluttertoast.showToast(msg: error.toString())));
  }

//Function 2
  ReadUser() async {
    var docsnap = await _DocumentReference.get();
    if (docsnap.exists) {
      Map<String, dynamic>? data = docsnap.data();
      Fluttertoast.showToast(msg: data.toString());
      // Fluttertoast.showToast(msg: data!["mail"]);
    } else {
      Fluttertoast.showToast(msg: "Not Found");
    }
  }

//Function 3
  UpdateUser() {
    Map<String, dynamic> updt = {
      "name": "Sourabh kumar",
      "mail": "qwertyuiop@yahoo.in",
      "dob": 3232323,
      "roll": "russia"
    };

    _DocumentReference.update(updt)
        .whenComplete(() => Fluttertoast.showToast(msg: "User Updated"))
        .onError((error, stackTrace) =>
            Fluttertoast.showToast(msg: error.toString()));
  }

//Function 4
  DeleteUser() {
    _DocumentReference.delete().whenComplete(() =>
        Fluttertoast.showToast(msg: "User Deleted").onError(
            (error, stackTrace) =>
                Fluttertoast.showToast(msg: error.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud with srv"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(88.0),
          child: ListView(
            children: [
              RaisedButton(
                onPressed: () {
                  AddUser();
                },
                child: Text("Add User"),
              ),
              RaisedButton(
                onPressed: () {
                  ReadUser();
                },
                child: Text("Read User"),
              ),
              RaisedButton(
                onPressed: () {
                  UpdateUser();
                },
                child: Text("Update User"),
              ),
              RaisedButton(
                onPressed: () {
                  DeleteUser();
                },
                child: Text("Delete User"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
