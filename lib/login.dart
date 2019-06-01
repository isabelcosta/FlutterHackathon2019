import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
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

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in " + user.toString());
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
                child: GoogleSignInButton(
                  onPressed: () {
                    _handleSignIn()
                        //TODO Alterar HomePageTest para a pagina das Threads
                        .then((FirebaseUser user) => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => HomePageTeste(user))))
                        .catchError((e) => print(e));
                  },
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
