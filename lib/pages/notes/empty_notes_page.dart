import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/assets/widgets/buttons.dart';

import '../../assets/widgets/text.dart';

class EmptyNotesPage extends StatelessWidget {
  const EmptyNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleText(
            text: "No Notes",
            fontSize: 26,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Center(
                child: NormalHintText(
              textColor: Colors.white54,
              textAlign: TextAlign.center,
              text:
                  'Add notes, reminders, set targets\n collect recources and secure privacy ',
            )),
          ),
          RoundedElevatedButton(
            child: Text('Add Note'),
            onPress: () {
              //   print(FirebaseAuth.instance.currentUser?.emailVerified);
            },
          )
        ]);
  }
}
