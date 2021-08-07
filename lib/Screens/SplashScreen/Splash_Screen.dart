import 'package:flutter/material.dart';
import 'package:helios/Screens/SIgnIn/GoogleSignIn/Google_Sign_In.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          child: Text("Get Started"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GoogleSignInScreen()));
          },
        ),
      ),
    );
  }
}
