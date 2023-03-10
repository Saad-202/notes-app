import 'package:flutter/material.dart';
import 'package:notesapp/assets/widgets/buttons.dart';
import 'package:notesapp/assets/widgets/text.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleText(
                    text: 'Get Started',
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: NormalHintText(
                      text: "Start taking Notes,",
                      textColor: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RoundedElevatedButton(
                      child: Text("Create Account"), onPress: () {}),
                  CustomTextButton(text: "Login", onPress: () {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
