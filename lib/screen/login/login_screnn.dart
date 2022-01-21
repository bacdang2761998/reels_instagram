import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reels_instagram/screen/bottom_bar/bottom_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Instagram',
            maxLines: 1,
            style:
                GoogleFonts.satisfy(fontSize: 42, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: () {
              signInWithGoogle();
            },
            child: Text('Login with Google'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Login with Facebook'),
          ),
        ],
      ),
    ));
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    if (googleUser != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => BottomBarScreen()),
          (route) => false);
    }
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //Future<void> _handleSignOut() => _googleSignIn!.disconnect();
}
