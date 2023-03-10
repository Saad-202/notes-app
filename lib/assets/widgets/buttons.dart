import 'package:flutter/material.dart';

//icon button
class NormalIconButton extends StatelessWidget {
  IconData icon;
  VoidCallback onPress;
  NormalIconButton({required this.icon, required this.onPress});
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPress, icon: Icon(icon));
  }
}

//rounded elevated button
class RoundedElevatedButton extends StatelessWidget {
  Widget child;
  VoidCallback onPress;
  double borderRadius;
  double marginTop;
  double marginBottom;
  double marginRight;
  double marginLeft;
  double paddingTop;
  double paddingBottom;
  double paddingRight;
  double paddingleft;

  RoundedElevatedButton({
    required this.child,
    required this.onPress,
    this.borderRadius = 24,
    this.marginTop = 48,
    this.marginBottom = 0,
    this.marginRight = 0,
    this.marginLeft = 0,
    this.paddingTop = 16,
    this.paddingBottom = 16,
    this.paddingRight = 24,
    this.paddingleft = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: marginTop,
            bottom: marginBottom,
            right: marginRight,
            left: marginLeft),
        child: FilledButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.only(
                top: paddingTop,
                bottom: paddingBottom,
                right: paddingRight,
                left: paddingleft),
          ),
          child: child,
        ));
  }
}

class CustomTextButton extends StatelessWidget {
  String text;
  VoidCallback onPress;
  double borderRadius;
  double marginTop;
  double marginBottom;
  double marginRight;
  double marginLeft;
  double paddingTop;
  double paddingBottom;
  double paddingRight;
  double paddingleft;

  CustomTextButton({
    required this.text,
    required this.onPress,
    this.borderRadius = 24,
    this.marginTop = 48,
    this.marginBottom = 0,
    this.marginRight = 0,
    this.marginLeft = 0,
    this.paddingTop = 16,
    this.paddingBottom = 16,
    this.paddingRight = 24,
    this.paddingleft = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: marginTop,
          bottom: marginBottom,
          right: marginRight,
          left: marginLeft),
      child: TextButton(
        onPressed: onPress,
        child: Text(text),
        style: TextButton.styleFrom(
            padding: EdgeInsets.only(
                top: paddingTop,
                bottom: paddingBottom,
                right: paddingRight,
                left: paddingleft),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
      ),
    );
  }
}

//floating action  button

class FloatingButton extends StatelessWidget {
  VoidCallback onPress;
  IconData icon;
  FloatingButton({required this.onPress, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: onPress, child: Icon(icon));
  }
}
