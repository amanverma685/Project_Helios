import 'package:flutter/material.dart';
import 'package:helios/Screens/HomeScreen/HomeScreen.dart';

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({Key? key}) : super(key: key);

  @override
  _GoogleSignInScreenState createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: ElevatedButton(
          child: Text("Login"),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
    );
  }
}
