import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helios/Screens/LandingScreen/LandingScreen.dart';
import 'package:helios/Screens/SignIn/PhoneOTPAuthentication/OTPScreen.dart';

class MobileNumberAuthentication extends StatefulWidget {
  const MobileNumberAuthentication({Key? key}) : super(key: key);

  @override
  _MobileNumberAuthenticationState createState() =>
      _MobileNumberAuthenticationState();
}

class _MobileNumberAuthenticationState
    extends State<MobileNumberAuthentication> {
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        top: 10,
                      ),
                      child: Center(
                        child: Text(
                          "Enter Your Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Enter your full name',
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        hintText: 'Enter your email',
                        labelText: 'Email',
                      ),
                    ),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefix: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text('+91'),
                        ),
                        icon: Icon(Icons.phone),
                        hintText: 'Enter your phone number',
                        labelText: 'Phone',
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length > 10) {
                          return 'Please enter valid phone number';
                        }
                        return null;
                      },
                    ),
                    Center(
                      child: ElevatedButton(
                        child: Text('Submit'),
                        onPressed: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OTPScreen(
                                  phoneController.value.text,
                                  nameController.value.text,
                                  emailController.value.text,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
