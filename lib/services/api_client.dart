import 'dart:convert';
import 'dart:developer';

import 'package:ed_call/models/EmailTemplate.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  const ApiClient();

  Future<String> sendEmail(EmailTemplate email) async {
    final response =
        await http.post(Uri.parse('http://192.168.43.88:3000/send'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(email.toJson()));

    log(response.statusCode.toString());
    if (response.statusCode == 201) {
      log(response.body);
      return response.body;
    } else {
      log(response.statusCode.toString());
      throw Exception('Failed to create EmailTemplate');
    }
  }
}
