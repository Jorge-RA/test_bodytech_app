import 'package:flutter/material.dart';

class FormsProvider extends ChangeNotifier {
  bool _isLoading = false;

  Map<String, String> loginForm = {
    'email': '',
    'password': '',
  };

  Map<String, String> registerForm = {
    'email': '',
    'password': '',
    'repeat_password': '',
    'phone': '',
  };

  bool get isLoading => _isLoading;

  set isLoading(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
  }
}
