import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed_call/models/EmailTemplate.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final CollectionReference myEmail =
      FirebaseFirestore.instance.collection('email');

  ApiClient();

  Future<String> sendEmail(EmailTemplate email) async {
    final response = await http.post(
        Uri.parse('https://fathomless-fortress-79357.herokuapp.com/send'),
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

  Future<void> storeEmail(EmailTemplate email) {
    return myEmail
        .add(email.toJson())
        .then((value) => log('Email added'))
        .catchError((error) => log('Failed to store email $error'));
  }
}
