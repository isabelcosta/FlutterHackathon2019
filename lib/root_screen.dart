// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2019/jobs_screen.dart';
import 'package:flutter_hackathon_2019/threads_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key key, this.user}) : super(key: key);
  final String user;
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentTab = 0;
  final List<Widget> _screens = [ThreadsScreen(), JobsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (index) => setState(() => _currentTab = index),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('Threads')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('Jobs')),
        ],
      ),
    );
  }
}
