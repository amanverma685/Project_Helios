import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

Future fetchAllBestsellerProducts() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  auth.currentUser!.getIdToken();

  final response = await http.get(
      Uri.parse(
          'https://8ap0me7rbk.execute-api.ap-south-1.amazonaws.com/dev/helios/get-all-bestseller-products'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "authorizationToken":
            "eyJhbGciOiJSUzI1NiIsImtpZCI6IjEyYWZkYjliOGJmZmMyY2M4ZTU4NGQ2ZWE2ODlmYzEwYTg3MGI2NzgiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiQW1hbiB2ZXJtYSIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS0vQU9oMTRHaXFfcjFLeE1OTzdyTFlxa0dHYjRNTlFTZUh4WUNmb3JYNEo0MGM9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vaGVsaW9zLWFxdWEiLCJhdWQiOiJoZWxpb3MtYXF1YSIsImF1dGhfdGltZSI6MTYzMTM2NDI3MywidXNlcl9pZCI6ImVzSmY1TE55RVJQTVNYN0wySDBFdVJUMkVkSDMiLCJzdWIiOiJlc0pmNUxOeUVSUE1TWDdMMkgwRXVSVDJFZEgzIiwiaWF0IjoxNjMxMzY0MjczLCJleHAiOjE2MzEzNjc4NzMsImVtYWlsIjoiYXYzNjIzMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjExMzI1NjA3OTY1OTc3NjkxNzQ2NyJdLCJlbWFpbCI6WyJhdjM2MjMyQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6Imdvb2dsZS5jb20ifX0.h1TnReamQl993r20pEtkQlNksBnmVfJusw8LzlYiOPlTMigyEccxXiVSawZO4kjl1bZ0JweA-5rgUqLHGk3j68lLVikszJdWKLjXC0jyOAHQNE8kphFHlFoWLtj7zM-dZVc-HYSfw8TXIqwUHpG-tBefLiG21RZn_Xg1otloYAylq8TN40hgYaXMKKUSSk24x8SWCzsrxGI0uZcDzvsQwcXfFyPIQBhluzyl2jQqNegM-lDUkl_oRk5j-D4MgFKdMFa52jsO5y3ajb7zBmxq27UWZDVK0TJYhDSA_VmR8VHdwuxfoK9nM6X3KNqQQi4zVzRNpyoQhdj6RCGOmJ_raA"
      });

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}
