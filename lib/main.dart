import 'package:flutter/material.dart';

import 'login.dart';

void main() => runApp(HackathonJobFinderApp());

class HackathonJobFinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackathon - Job Finder',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginScreen(),
    );
  }
}

