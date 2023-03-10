import 'package:flutter/material.dart';

class EmailProvider extends ChangeNotifier {
  String _email = '';
  String _controllerText = '';

  String get email => _email;
  String get controllerText => _controllerText;

  void assignEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void changeControllerText(String text) {
    _controllerText = text;
    notifyListeners();
  }
}
