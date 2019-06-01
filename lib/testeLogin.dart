import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageTeste extends StatefulWidget {
  @override
  _HomePageTesteState createState() => _HomePageTesteState();

  FirebaseUser user;

  HomePageTeste(this.user);


}

class _HomePageTesteState extends State<HomePageTeste> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(widget.user.displayName),
          Text(widget.user.email),
          Image.network(widget.user.photoUrl),

          //Text(widget.user.phoneNumber)
        ],
      )
    );
  }
}
