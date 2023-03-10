import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/assets/widgets/text.dart';

import '../../assets/widgets/buttons.dart';
import '../../assets/widgets/custom_appbar.dart';

class AddorUpdate extends StatelessWidget {
  const AddorUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Add Note",
        actionItems: [NormalIconButton(icon: Icons.done, onPress: () {})],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 48, left: 16, right: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TitleTextField(),
            ),
            NormalHintText(
              text: 'Jan 24 Thu',
              fontSize: 14,
              textColor: Colors.white54,
            ),
            NotesTextField(),
          ],
        ),
      ),
    );
  }
}

class TitleTextField extends StatelessWidget {
  const TitleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
      decoration: InputDecoration(hintText: "Title", border: InputBorder.none),
    );
  }
}

class NotesTextField extends StatelessWidget {
  const NotesTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
            hintText: "Write your Note...", border: InputBorder.none),
      ),
    );
  }
}
