import 'package:flutter/material.dart';
import 'package:notesapp/assets/widgets/buttons.dart';
import 'package:notesapp/assets/widgets/snackbar.dart';
import 'package:notesapp/assets/widgets/text.dart';
import 'package:notesapp/assets/widgets/textfield.dart';
import 'package:notesapp/authentication/auth_exceptions.dart';
import 'package:notesapp/authentication/auth_services.dart';
import 'package:notesapp/constants/consts.dart';
import 'package:notesapp/state_management/text_field_provider.dart';
import 'package:provider/provider.dart';

import '../../assets/widgets/row_button.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    //email and password controllers
    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController passwordController = TextEditingController(text: '');

    return Scaffold(
        body: Wrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //title
          AuthTitleText(text: "Sign in"),
          //email text field,provider is used to display error messages
          Consumer<TextFieldProvider>(
            builder: (context, value, child) => EmailTextField(
                emailController: emailController,
                errorText: value.signinEmailText),
          ),

          //password text field,provider is used to display error messages and toggle the visibility
          Consumer<TextFieldProvider>(
            builder: (context, value, child) => PasswordTextField(
              passwordController: passwordController,
              errorText: value.signinPasswordText,
              obscureText: value.isVisible,
              changeVisibilty: () {
                value.changeVisibility();
              },
            ),
          ),

          //sends user to forgot password page
          const ForgotPasswordButton(),

          //signin the user
          SigninButton(
            emailController: emailController,
            passwordController: passwordController,
          ),

          //a row with text and textbutton

          RowButton(
            text: "Don't have an Account?",
            buttonText: 'Sign up',
            onButtonPress: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/sign_up', (route) => false);
            },
          ),
        ],
      ),
    ));
  }
}

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/forgot_password', (route) => false);
      },
      child: NormalHintText(
        text: "Forgot Password?",
        textColor: Theme.of(context).primaryColor,
        fontSize: hintTextSize,
      ),
    );
  }
}

class SigninButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SigninButton(
      {super.key,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TextFieldProvider>(context, listen: false);

    return RoundedElevatedButton(
        child: const Text("Sign in"),
        onPress: () async {
          provider.changeSigninPasswordErrorText('');
          provider.changeSigninEmailErrorText('');

          final email = emailController.text;
          final password = passwordController.text;

          if (email != '' && password != '') {
            try {
              await AuthServices.firebase()
                  .signIn(email: email, password: password);

              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/homePage', (route) => false);
            } on UserNotFoundAuthException {
              print('user not found');
              GlobalSnackBar.show(context, 'User not found');
            } on WrongPasswordAuthException {
              GlobalSnackBar.show(context, 'Wrong Password');
            } on NoInternetConnection {
              GlobalSnackBar.show(context, 'No Internet Connection');
            } on InvalidEmailAuthException {
              provider.changeSigninEmailErrorText('Invalid Email');
            } on GenericAuthException {
              GlobalSnackBar.show(context, 'Something went Wrong');
            }
          } else if (password == "" && email == "") {
            provider.changeSigninPasswordErrorText('Please fill this field');
            provider.changeSigninEmailErrorText('Please fill this field');
          } else if (password == '') {
            provider.changeSigninPasswordErrorText('Please fill this field');
          } else if (email == '') {
            provider.changeSigninEmailErrorText('Please fill this field');
          }

          print(provider.signinEmailText);
          print('${provider.signinPasswordText} error:');
        });
  }
}

//wraps the column with center and singleChildScrollView
class Wrapper extends StatelessWidget {
  Widget child;
  Wrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(32),
        child: child,
      )),
    );
  }
}

// import 'package:flutter/material.dart';

// enum ButtonState { notAdded, added }

// class SigninPage extends StatefulWidget {
//   @override
//   State<SigninPage> createState() => _SigninPageState();
// }

// class _SigninPageState extends State<SigninPage> {
//   ButtonState state = ButtonState.notAdded;
//   @override
//   Widget build(BuildContext context) {
//     final notAdded = state == ButtonState.notAdded;
//     print(notAdded);

//     return Scaffold(
//         body: Center(child: notAdded ? addButton() : addedButton()));
//   }

//   Widget addButton() {
//     return ElevatedButton(
//       onPressed: () async {
//         print(state);
//         //    await Future.delayed((Duration(seconds: 3)));
//         setState(() {
//           state = ButtonState.added;
//         });
//       },
//       child: Row(children: [
//         Icon(Icons.account_box_rounded)
//         SizedBox()
//       ],)
//     );
//   }

//   Widget addedButton() {
//     return Container(
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//       ),
//       child: IconButton(
//         icon: Icon(Icons.done),
//         onPressed: () async {
//           print(state);
//           //    await Future.delayed((Duration(seconds: 3)));
//           setState(() {
//             state = ButtonState.notAdded;
//           });
//         },
//       ),
//     );
//   }
// }

