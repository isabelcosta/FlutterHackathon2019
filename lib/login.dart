// import 'package:flutter/material.dart';
// import 'package:flutter_hackathon_2019/root_screen.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class LoginScreen extends StatefulWidget {
//   LoginScreen({Key key}) : super(key: key);
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'displayName', 'photoUrl']);
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<FirebaseUser> _handleSignIn() async {
//     final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//     if (googleUser == null) {
//       return null;
//     }
//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//     final AuthCredential credential = GoogleAuthProvider.getCredential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     final FirebaseUser user = await _auth.signInWithCredential(credential);
//     print("signed in " + user.toString());
//     return user;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Text(
//                 'Job Finder',
//                 style: Theme.of(context).textTheme.display1,
//               ),
//               RaisedButton(
//                 child: Text('SIGN IN '),
//                 onPressed: () {
//                   _handleSignIn()
//                       .then((FirebaseUser user) =>
//                           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RootScreen(user: user))))
//                       .catchError((e) => print(e));
//                 },
//               ),
//               Text(
//                 'Description',
//                 style: Theme.of(context).textTheme.body2,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
