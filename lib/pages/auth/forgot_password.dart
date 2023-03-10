import 'package:flutter/material.dart';

import 'package:notesapp/assets/widgets/text.dart';
import 'package:notesapp/assets/widgets/textfield.dart';
import 'package:notesapp/assets/widgets/buttons.dart';
import 'package:notesapp/authentication/auth_services.dart';
import 'package:notesapp/state_management/email_provider.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    String controllerText =
        Provider.of<EmailProvider>(context, listen: false).controllerText;
    TextEditingController _emailController =
        TextEditingController(text: controllerText);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleText(text: "Forgot Password?"),
            NormalHintText(
              text:
                  "Enter your email and we will send you an password reset email",
              fontSize: 14,
              textColor: Colors.grey,
            ),
            UnderLineTextField(
              controller: _emailController,
              hintText: 'Email Address',
              padding: EdgeInsets.only(top: 38, bottom: 0),
            ),
            Consumer<EmailProvider>(builder: (context, value, child) {
              return RoundedElevatedButton(
                marginTop: 28,
                onPress: () async {
                  try {
                    await AuthServices.firebase()
                        .sendPasswordResetEmail(email: _emailController.text);
                    value.assignEmail(_emailController.text);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/email_send', (route) => false);
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text('Send Email'),
              );
            }),
            CustomTextButton(
              text: 'Resend Password',
              onPress: () {},
              marginTop: 8,
            )
          ],
        ),
      ),
    );
  }
}
