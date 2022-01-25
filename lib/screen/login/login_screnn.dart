import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reels_instagram/screen/app_bar/bottom_bar.dart';
import 'sign_in_state_notifier.dart';

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
          _customButton(
            label: 'Login with Google',
            iconData: FontAwesomeIcons.google,
            iconColor: Color(0xFFf44336),
            onTap: () {
              _signInWithGoogle();
            },
          ),
          _customButton(
            label: 'Login with Facebook',
            iconColor: Color(0xFF2986cc),
            iconData: FontAwesomeIcons.facebook,
            onTap: () {
              _signInWithFacebook();
            },
          )
        ],
      ),
    ));
  }

  Widget _customButton(
      {Color backgoundColor = Colors.white,
      required String label,
      Color labelColor = Colors.blue,
      required Color iconColor,
      required IconData iconData,
      required Function() onTap}) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgoundColor),
      ),
      onPressed: onTap,
      icon: FaIcon(
        iconData,
        color: iconColor,
      ),
      label: Text(
        label,
        style: TextStyle(color: labelColor),
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    await context.read<SignInStateNotifier>().signInWithGoogle();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      'Login Succesfull',
      style: TextStyle(color: Colors.green),
    )));
    await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BottomBarScreen()));
  }

  Future<void> _signInWithFacebook() async {
    await context.read<SignInStateNotifier>().signInWithFacebook();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      'Login Succesfull',
      style: TextStyle(color: Colors.green),
    )));
    await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BottomBarScreen()));
  }
}
