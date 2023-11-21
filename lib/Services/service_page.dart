import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var baseUrl = 'http://59.97.132.209:4060/api';

login(payload) async {
  try {
    return await http.post(Uri.parse('$baseUrl/user/signin'),
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
      Uri.parse('$baseUrl/iron/blastfurnace'),
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
      Uri.parse('$baseUrl/steelmills/basicoxygenfurnace'),
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
      Uri.parse('$baseUrl/steelmills/mills'),
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

technoeconomics() async {
  try {
    return await http.get(
      Uri.parse('$baseUrl/overview/technoeconomics'),
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

sinterplant() async {
  try {
    return await http.get(
      Uri.parse('$baseUrl/iron/sinterplant'),
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

continuouscastingplant() async {
  try {
    return await http.get(
      Uri.parse('$baseUrl/steelmills/continuouscastingplant'),
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

powerblowingstation() async {
  try {
    return await http.get(
      Uri.parse('$baseUrl/utility/powerblowingstation'),
      headers: {
        'content-type': 'application/json',
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

cbm() async {
  try {
    return await http.get(
      Uri.parse('$baseUrl/utility/cbm'),
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

cokeovens() async {
  try {
    return await http.get(
      Uri.parse('$baseUrl/iron/cokeovens'),
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

ladleheatingfurnace() async {
  try {
    return await http.get(
      Uri.parse('$baseUrl/steelmills/ladleheatingfurnace'),
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

byproductplant() async {
  try {
    return await http.get(
      Uri.parse('$baseUrl/iron/byproductplant'),
      headers: {
        'content-Type': 'application/json',
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

limedolocalcinationplant() async {
  try {
    return await http.get(
      Uri.parse('$baseUrl/utility/ldcp'),
      headers: {
        'content-Type': 'application/json',
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

oxygenplant() async {
  try {
    return await http.get(
      Uri.parse('$baseUrl/utility/oxygenplant'),
      headers: {
        'content-Type': 'application/json',
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

bfstockhouse() async {
  try {
    return await http.get(
      Uri.parse('$baseUrl/iron/bfstockhouse'),
      headers: {
        'content-Type': 'application/json',
        'Authorization': 'Bearer c2lzeFVQVkF1dGg6aUk1YzAkUzE5TA==',
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

cdcpservice() async {
  try {
    return await http.get(
      Uri.parse('$baseUrl/iron/cdcp'),
      headers: {
        'content-Type': 'application/json',
        'Authorization': 'Bearer c2lzeFVQVkF1dGg6aUk1YzAkUzE5TA==',
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

stoveservice() async {
  try {
    return await http.get(
      Uri.parse('$baseUrl/iron/stove'),
      headers: {
        'content-Type': 'application/json',
        'Authorization': 'Bearer c2lzeFVQVkF1dGg6aUk1YzAkUzE5TA==',
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

gcpservice() async {
  try {
    return await http.get(
      Uri.parse('$baseUrl/iron/gcptrtg'),
      headers: {
        'content-Type': 'application/json',
        'Authorization': 'Bearer c2lzeFVQVkF1dGg6aUk1YzAkUzE5TA==',
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
