import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helios/Screens/LandingScreen/LandingScreen.dart';

class MobileNumberAuthentication extends StatefulWidget {
  const MobileNumberAuthentication({Key? key}) : super(key: key);

  @override
  _MobileNumberAuthenticationState createState() =>
      _MobileNumberAuthenticationState();
}

class _MobileNumberAuthenticationState
    extends State<MobileNumberAuthentication> {
  late String userName;
  late String userMobileNumber;
  late String userEmail;
  late String gender;
  late String dateOfBirth;
  late String smaCode;

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future verifyPhoneNumber() async {
    await auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 60),
        phoneNumber: '+919179273937',
        verificationCompleted: (PhoneAuthCredential credential) async {
          print("Inside Credential");
          await auth.signInWithCredential(credential);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Update the UI - wait for the user to enter the SMS code
          String smsCode = 'xxxx';

          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          await auth.signInWithCredential(credential);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter your full name',
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userName = value.toString();
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.phone),
                        hintText: 'Enter your phone number',
                        labelText: 'Phone',
                      ),
                      onSaved: (value) {
                        userMobileNumber = value.toString();
                      },
                      validator: (value) {
                        if (value!.isEmpty || value.length > 10) {
                          return 'Please enter valid phone number';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.calendar_today),
                        hintText: 'Enter your email',
                        labelText: 'Email',
                      ),
                      onSaved: (value) {
                        userEmail = value.toString();
                      },
                      validator: (value) {
                        if (value!.isEmpty ||
                            value.length < 5 ||
                            !(value.contains("@"))) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    new Container(
                      padding: EdgeInsets.only(left: 150.0, top: 40.0),
                      child: ElevatedButton(
                        child: Text('Submit'),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await verifyPhoneNumber();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
