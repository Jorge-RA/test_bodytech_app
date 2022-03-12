import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthServices {
  static Future<String?> authLogin(String email, String password) async {
    String _baseUrl = 'identitytoolkit.googleapis.com';

    final url = Uri.https(
      _baseUrl,
      '/v1/accounts:signInWithPassword',
      {
        'key': 'AIzaSyDuhWaRUrOQroW3xlPP-UTEDNlzlqKntOs',
      },
    );

    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });

    final decodedData = json.decode(response.body);

    print(decodedData);

    if (decodedData.containsKey('idToken')) {
      return null;
    }
    return decodedData['error']['message'];
  }

  static Future<String?> createAccount(String email, String password) async {
    String _baseUrl = 'identitytoolkit.googleapis.com';

    final url = Uri.https(
      _baseUrl,
      '/v1/accounts:signUp',
      {
        'key': 'AIzaSyDuhWaRUrOQroW3xlPP-UTEDNlzlqKntOs',
      },
    );

    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });

    final decodedData = json.decode(response.body);

    print(decodedData);

    if (decodedData.containsKey('idToken')) {
      return null;
    }
    return decodedData['error']['message'];
  }
}
