import 'package:flutter/material.dart';
import 'package:notesapp/assets/widgets/text.dart';

import '../../constants/consts.dart';

// ignore: must_be_immutable
class RowButton extends StatelessWidget {
  String text;
  String buttonText;
  VoidCallback onButtonPress;
  RowButton(
      {super.key,
      required this.text,
      required this.buttonText,
      required this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(lessWidgetPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NormalHintText(text: text),
          GestureDetector(
            onTap: onButtonPress,
            child: NormalHintText(
              text: buttonText,
              textColor: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
