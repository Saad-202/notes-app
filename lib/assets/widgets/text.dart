import 'package:flutter/material.dart';

import '../../constants/consts.dart';

class TitleText extends StatelessWidget {
  String text;
  double fontSize;
  TextAlign textAlign;
  EdgeInsetsGeometry? margin;
  FontWeight fontWeight;

  TitleText(
      {required this.text,
      this.textAlign = TextAlign.start,
      this.fontSize = 24,
      this.fontWeight = FontWeight.normal,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin == null ? EdgeInsets.all(0) : margin!,
      child: Text(text,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: fontWeight,
              )),
    );
  }
}

class NormalHintText extends StatelessWidget {
  String text;
  double fontSize;
  Color textColor;
  TextAlign textAlign;

  NormalHintText({
    required this.text,
    this.fontSize = 14,
    this.textColor = Colors.white70,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style:
            Theme.of(context).textTheme.labelLarge!.copyWith(color: textColor));
  }
}

class AuthTitleText extends StatelessWidget {
  String text;

  AuthTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TitleText(
      margin: const EdgeInsets.symmetric(vertical: normalWidgetPadding),
      text: 'Sign in',
      textAlign: TextAlign.start,
    );
  }
}
