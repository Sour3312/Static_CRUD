// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:crud_firebase/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  //Firebase setup to file
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomesScreen());
}

class HomesScreen extends StatefulWidget {
  HomesScreen({Key? key}) : super(key: key);

  @override
  State<HomesScreen> createState() => _HomesScreenState();
}

class _HomesScreenState extends State<HomesScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Scaffold(
          appBar: AppBar(
            title: Text("CRUD with srv"),
          ),
          body: LoginPage(),
        ),
      ),
    );
  }
}
