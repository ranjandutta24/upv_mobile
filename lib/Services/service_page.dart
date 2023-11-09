import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var baseUrl = 'http://59.97.132.209:4060/api/user/signin';

login(payload) async {
  try {
    return await http.post(
        Uri.parse('http://59.97.132.209:4060/api/user/signin'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer c2lzeFVQVkF1dGg6aUk1YzAkUzE5TA=='
        },
        body: payload);
  } catch (error) {
    SnackBar(
      duration: const Duration(seconds: 3),
      content: const Center(
        child: Text('api call error'),
      ),
      action: SnackBarAction(label: '', onPressed: () {}),
    );
  }
}

blastfurnace() async {
  try {
    return await http.get(
      Uri.parse('http://59.97.132.209:4060/api/iron/blastfurnace'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c2lzeFVQVkF1dGg6aUk1YzAkUzE5TA=='
      },
    );
  } catch (error) {
    SnackBar(
      duration: const Duration(seconds: 3),
      content: const Center(
        child: Text('api call error'),
      ),
      action: SnackBarAction(label: '', onPressed: () {}),
    );
  }
}

Basicoxygenfurnace() async {
  try {
    return await http.get(
      Uri.parse('http://59.97.132.209:4060/api/steelmills/basicoxygenfurnace'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c2lzeFVQVkF1dGg6aUk1YzAkUzE5TA=='
      },
    );
  } catch (error) {
    SnackBar(
      duration: const Duration(seconds: 3),
      content: const Center(
        child: Text('api call error'),
      ),
      action: SnackBarAction(label: '', onPressed: () {}),
    );
  }
}

mills() async {
  try {
    return await http.get(
      Uri.parse('http://59.97.132.209:4060/api/steelmills/mills'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c2lzeFVQVkF1dGg6aUk1YzAkUzE5TA=='
      },
    );
  } catch (error) {
    SnackBar(
      duration: const Duration(seconds: 3),
      content: const Center(
        child: Text('api call error'),
      ),
      action: SnackBarAction(label: '', onPressed: () {}),
    );
  }
}
