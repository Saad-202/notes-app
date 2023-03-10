import 'package:flutter/material.dart';
import 'package:notesapp/authentication/auth_services.dart';
import 'package:notesapp/pages/auth/signup_page.dart';

import '../authentication/auth_services.dart';

class TextFieldProvider extends ChangeNotifier {
  bool _isVisible = false;
  String signUpEmailErrorText = '';
  String signUpPasswordErrorText = '';
  String signUpPasswordRepeatErrorText = '';
  String signinPasswordText = '';
  String signinEmailText = '';

  bool get isVisible => _isVisible;

  changeVisibility() {
    _isVisible ? _isVisible = false : _isVisible = true;
    ;
    notifyListeners();
  }

  changeSignUpEmailErrorText(String text) {
    signUpEmailErrorText = text;
    notifyListeners();
  }

  changeSigninEmailErrorText(String text) {
    signinEmailText = text;
    notifyListeners();
  }

  changeSignupPasswordErrorText(String text) {
    signUpPasswordErrorText = text;
    notifyListeners();
  }

  changeSignupPasswordRepeatErrorText(String text) {
    signUpPasswordRepeatErrorText = text;
    notifyListeners();
  }

  changeSigninPasswordErrorText(String text) {
    signinPasswordText = text;
    notifyListeners();
  }
}
