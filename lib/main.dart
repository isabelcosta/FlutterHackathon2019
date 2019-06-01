import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2019/jobs_screen.dart';
import 'package:flutter_hackathon_2019/root_screen.dart';
import 'login.dart';

void main() => runApp(HackathonJobFinderApp());

FirebaseUser GLOBAL_USER;


class HackathonJobFinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackathon - Job Finder',
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginScreen(),
    );
  }
}

