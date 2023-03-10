import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notesapp/assets/widgets/buttons.dart';
import 'package:notesapp/assets/widgets/text.dart';
import 'package:notesapp/assets/widgets/textfield.dart';
import 'package:notesapp/authentication/auth_exceptions.dart';
import 'package:notesapp/authentication/auth_services.dart';
import 'package:notesapp/state_management/text_field_provider.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController(text: '');
    TextEditingController _passwordController = TextEditingController(text: '');
    TextEditingController _repeatPasswordController =
        TextEditingController(text: '');
    bool isLoading = false;
    String emailErrorMessage = '';

    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
    }

    return Scaffold(body: Wrapper(
      consumer: Consumer<TextFieldProvider>(builder: (context, value, child) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: TitleText(
                  text: 'Create Account',
                  textAlign: TextAlign.start,
                ),
              ),
              UnderLineTextField(
                errorText: _emailController.text == ''
                    ? 'Please fill this field'
                    : value.signUpEmailErrorText,
                padding: EdgeInsets.symmetric(vertical: 8),
                preffixIcon: Icon(Icons.email_outlined),
                hintText: 'Email Address',
                controller: _emailController,
              ),
              UnderLineTextField(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  preffixIcon: Icon(Icons.lock_outlined),
                  hintText: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                  errorText: _passwordController.text == ''
                      ? 'Please fill this field'
                      : value.signUpPasswordErrorText,
                  suffixIcon: NormalIconButton(
                    icon: value.isVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onPress: () {
                      value.changeVisibility();
                    },
                  )),
              UnderLineTextField(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  preffixIcon: Icon(Icons.lock_outlined),
                  hintText: 'Repeat Password',
                  controller: _repeatPasswordController,
                  obscureText: true,
                  errorText: _emailController.text == ''
                      ? 'Please fill thsi field'
                      : value.signUpPasswordRepeatErrorText,
                  suffixIcon: NormalIconButton(
                    icon: value.isVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onPress: () {},
                  )),
              RoundedElevatedButton(
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Text("Loading"),
                          ],
                        )
                      : Text("Sign Up"),
                  onPress: () async {
                    value.changeSignUpEmailErrorText('');
                    value.changeSignupPasswordErrorText('');
                    value.changeSignupPasswordRepeatErrorText('');
                    String password = _passwordController.text;
                    String repeatPassword = _repeatPasswordController.text;
                    String email = _emailController.text;

                    if (AuthServices.firebase().currentUser == null &&
                        password == repeatPassword &&
                        email != '' &&
                        password != '' &&
                        repeatPassword != null) {
                      try {
                        isLoading = true;
                        await AuthServices.firebase().signUp(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/verify_email', (route) => false);
                        isLoading = false;
                        AuthServices.firebase().currentState();
                      } on EmailAlreadyInUseAuthException {
                        isLoading = false;
                        value
                            .changeSignUpEmailErrorText('Email Already in use');
                      } on WeakPasswordAuthException {
                        isLoading = false;
                        value.changeSignupPasswordErrorText(
                          'Week Password',
                        );
                      } on InvalidEmailAuthException {
                        isLoading = false;
                        value.changeSignUpEmailErrorText(
                          'Invalid email',
                        );
                      } on GenericAuthException {
                        isLoading = false;
                        print("something went wrong");
                      } on NoInternetConnection {
                        isLoading = false;
                        print('no internet ');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            action: SnackBarAction(
                              label: "Ok",
                              onPressed: () {},
                            ),
                            content: Text("No Internet Connection")));
                      }
                    } else if (AuthServices.firebase().currentUser != null) {
                      print('user already signed in ');
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/homePage', (route) => false);
                    } else if (password != repeatPassword) {
                      value.changeSignupPasswordRepeatErrorText(
                          'Password does not match');
                    }
                    ;
                    isLoading = false;
                  }),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalHintText(text: "Have an account?"),
                    GestureDetector(
                      child: NormalHintText(
                        text: 'Sign in',
                        textColor: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ]);
      }),
    ));
  }
}

class Wrapper extends StatelessWidget {
  Consumer consumer;

  Wrapper({required this.consumer});
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child:
                Padding(padding: const EdgeInsets.all(32.0), child: consumer)));
  }
}
