import 'package:flutter/material.dart';
import 'package:notesapp/assets/theme.dart';
import 'package:notesapp/state_management/text_field_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/consts.dart';
import 'buttons.dart';

class UnderLineTextField extends StatelessWidget {
  Icon? preffixIcon;
  NormalIconButton? suffixIcon;
  String hintText;
  bool obscureText;
  TextEditingController controller;
  EdgeInsets padding;
  String errorText;

  UnderLineTextField(
      {super.key,
      this.preffixIcon,
      required this.hintText,
      this.errorText = '',
      required this.controller,
      this.suffixIcon,
      this.obscureText = false,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        cursorColor: Theme.of(context).primaryColor,
        controller: controller,
        style: TextStyle(fontSize: 14),
        obscureText: obscureText,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            errorText: errorText,
            filled: true,
            prefixIcon: preffixIcon,
            contentPadding: EdgeInsets.all(12),
            hintText: hintText,
            //   fillColor: textFieldFillColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,

              //   borderRadius: BorderRadius.circular(8),
            )),
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  TextEditingController emailController;
  String errorText;

  EmailTextField(
      {super.key, required this.emailController, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return UnderLineTextField(
      errorText: errorText,
      controller: emailController,
      padding: const EdgeInsets.symmetric(vertical: lessWidgetPadding),
      preffixIcon: Icon(Icons.email_outlined),
      hintText: 'Email Address',
    );
  }
}

class PasswordTextField extends StatelessWidget {
  TextEditingController passwordController;
  String errorText;
  bool obscureText;
  VoidCallback changeVisibilty;
  PasswordTextField(
      {super.key,
      required this.passwordController,
      required this.errorText,
      required this.obscureText,
      required this.changeVisibilty});

  @override
  Widget build(BuildContext context) {
    IconData currentIcon =
        obscureText ? Icons.visibility_off : Icons.visibility;

    return UnderLineTextField(
        padding: const EdgeInsets.only(
          top: lessWidgetPadding,
        ),
        preffixIcon: Icon(Icons.lock_outline),
        hintText: 'Password',
        errorText: errorText,
        controller: passwordController,
        obscureText: obscureText,
        suffixIcon: NormalIconButton(
          onPress: changeVisibilty,
          icon: currentIcon,
        ));
  }
}
