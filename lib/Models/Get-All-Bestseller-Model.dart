import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchAllBestsellerProducts() async {
  final response = await http.get(Uri.parse(
      'https://8ap0me7rbk.execute-api.ap-south-1.amazonaws.com/dev/helios/get-all-bestseller-products'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}
