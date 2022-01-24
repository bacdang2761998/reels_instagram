import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reels_instagram/screen/app_bar/bottom_bar.dart';

import 'google_signin_api.dart';

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
          ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                signIn();
              },
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red,
              ),
              label: Text(
                'Login with Google',
                style: TextStyle(color: Colors.blue),
              )),
          ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.facebook,
              color: Colors.blue,
            ),
            label: Text(
              'Login with Facebook',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    ));
  }

  Future signIn() async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign in Fail')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login Succesfull')));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BottomBarScreen(
                user: user,
              )));
    }
  }
}
