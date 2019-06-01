import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2019/jobs_screen.dart';

void main() => runApp(HackathonJobFinderApp());

class HackathonJobFinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackathon - Job Finder',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: JobsScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Job Finder',
                style: Theme.of(context).textTheme.display1,
              ),
              RaisedButton(
                child: Text('SIGN IN '),
                onPressed: () {},
              ),
              Text(
                'Job Finder',
                style: Theme.of(context).textTheme.display1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
