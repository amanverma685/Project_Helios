import 'package:flutter/material.dart';
import 'package:helios/Screens/SIgnIn/GoogleSignIn/Google_Sign_In.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Lottie.asset('assets/images/bottle-filling.json'),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: Text("Press Here To Get Started"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GoogleSignInScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
