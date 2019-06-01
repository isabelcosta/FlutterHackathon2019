import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'main.dart';
import 'testeLogin.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn _googleSignIn =
      GoogleSignIn(scopes: ['email', 'displayName', 'photoUrl']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController textUsername = TextEditingController();
  final TextEditingController textPassword = TextEditingController();

  bool isSignIn = false;

  Future<FirebaseUser> _handleSignIn() async {


    FirebaseUser user;
    print("signed in " + user.toString());

    if(isSignIn){
      user = await _auth.signInWithEmailAndPassword(email: textUsername.value.text, password: textPassword.value.text);
    }
    else{
      user =  await _auth.createUserWithEmailAndPassword(email: textUsername.value.text, password: textPassword.value.text);
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.green])),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SafeArea(
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    Image.asset('assets/login_title.png'),
                    Text(
                      'Job Finder',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[
                    Card(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: textUsername,

                          ),
                          TextField(
                            controller: textPassword,
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Switch(
                          value: isSignIn,
                          onChanged: (value){setState(() {
                            isSignIn = value;
                          });},
                        ),
                        RaisedButton(
                          color: isSignIn ? Colors.green : Colors.blue,
                          child: Text(
                            isSignIn ? 'Log In' : 'Sign In',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        onPressed: () {
                          _handleSignIn()
                              //TODO Alterar HomePageTest para a pagina das Threads
                              .then((FirebaseUser user) {
                                GLOBAL_USER = user;
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) {
                                        HomePageTeste(user);
                                      }));})
                              .catchError((e) => print(e));
                        },
                  ),
                      ],
                    )],
                ),
              )),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.all(16),
                      child: Text(
                      'This is a Flutter app in which you can find new experts and new questions about your favourite topic: Flutter',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                      ),
                    ),
                  )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
