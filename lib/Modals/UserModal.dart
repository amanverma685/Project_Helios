import 'package:flutter/foundation.dart';

class UserDataModel extends ChangeNotifier {
  // UserDataModel(this.name, this.email, this.photoUrl, this.age,
  //     this.mobileNumber, this.dateOfBirth);
  String name = "Sarah Abs";
  String email = "sarah@abs.com";
  String photoUrl =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';
  int age = 20;
  String mobileNumber = '+919179273937';
  String dateOfBirth = '27/04/1998';

  void changeUserDetails(data) {
    this.name = data['name'];
    this.email = data['email'];
    this.photoUrl = data['photoUrl'];
    this.age = data['age'];
    this.mobileNumber = data['mobileNumber'];
    this.dateOfBirth = data['dateOfBirth'];
    notifyListeners();
  }
}
