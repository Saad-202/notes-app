import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notesapp/assets/widgets/buttons.dart';
import 'package:notesapp/assets/widgets/text.dart';
import 'package:notesapp/authentication/auth_exceptions.dart';
import 'package:notesapp/authentication/auth_services.dart';

class VerifyAccountPage extends StatelessWidget {
  const VerifyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
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
              child: NormalHintText(
                textAlign: TextAlign.center,
                text:
                    'We have send a verification email to test@gmail.com, please verify your account',
                textColor: Colors.white70,
              ),
            ),
            RoundedElevatedButton(
                child: Text("Return to Homepage"),
                onPress: () async {
                  AuthServices.firebase().currentState();
                  await FirebaseAuth.instance.currentUser?.reload();
                  print(FirebaseAuth.instance.currentUser!.emailVerified);
                  if (FirebaseAuth.instance.currentUser!.emailVerified ==
                      true) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/homePage', (route) => false);
                  }
                }),
            CustomTextButton(
                text: "Send Verification email",
                onPress: () async {
                  try {
                    await AuthServices.firebase().sendEmailVerificationCode();
                    print('send');
                  } on UserNotLoggedInAuthException {
                    print("user not Logged in ");
                  }
                }),
          ],
        ),
      ),
    );
  }
}
