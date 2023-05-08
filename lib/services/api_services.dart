import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

  static Future get({required String? key}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await client.get(
        Uri.parse(key != null
            ? "https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/1"
            : 'https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/'),
        headers: headers);

    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      return null;
    }
  }
}
