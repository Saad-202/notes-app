import 'package:flutter/material.dart';

import 'package:notesapp/assets/widgets/buttons.dart';
import 'package:notesapp/assets/widgets/text.dart';
import 'package:notesapp/state_management/email_provider.dart';
import 'package:provider/provider.dart';

class EmailSend extends StatelessWidget {
  const EmailSend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
                child: Icon(
              Icons.email_outlined,
              size: 128,
            )),
            TitleText(
              text: 'Email Send',
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
              ),
              child: Consumer<EmailProvider>(
                builder: (context, value, child) {
                  return NormalHintText(
                    text:
                        'We have send an email to ${value.email}, please check your inbox and reset your password',
                    textColor: Colors.white70,
                  );
                },
              ),
            ),
            Consumer<EmailProvider>(
              builder: (context, value, child) {
                return RoundedElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.arrow_back_rounded),
                        SizedBox(
                          width: 24,
                        ),
                        Text("Return to Login"),
                      ],
                    ),
                    onPress: () {
                      value.changeControllerText('');
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/sign_in', (route) => false);
                    });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextButton(text: "Resend email", onPress: () {}),
                Consumer<EmailProvider>(
                  builder: (context, value, child) => CustomTextButton(
                      text: "Change email",
                      onPress: () {
                        value.changeControllerText('${value.email}');
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/forgot_password', (route) => false);
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
