import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

Future fetchAllBestsellerProducts() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String authorizationToken = await auth.currentUser!.getIdToken();

  final response = await http.get(
      Uri.parse(
          'https://8ap0me7rbk.execute-api.ap-south-1.amazonaws.com/dev/helios/get-all-bestseller-products'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "authorizationToken": authorizationToken
      });

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}
