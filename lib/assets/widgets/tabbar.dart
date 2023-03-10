import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notesapp/assets/widgets/text.dart';

class CustomTabBar extends StatelessWidget {
  TabController tabController;
  String firstItem;
  String secondItem;
  CustomTabBar(
      {required this.tabController,
      required this.firstItem,
      required this.secondItem});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: TabBar(
          indicator:
              CustomTabBarIndicator(2, 48, 8, Theme.of(context).primaryColor),
          padding: EdgeInsets.all(16),
          controller: tabController,
          tabs: [
            Padding(
                padding: EdgeInsets.all(8),
                child: TitleText(text: '${firstItem}', fontSize: 16)),
            Padding(
                padding: EdgeInsets.all(8),
                child: TitleText(text: '${secondItem}', fontSize: 16)),
          ]),
    );
  }
}

CustomTabBarIndicator(double borderThickness, double horizontalInset,
    double indicatorBorderRadius, Color indicatorColor) {
  return UnderlineTabIndicator(
      borderRadius: BorderRadius.circular(indicatorBorderRadius),
      borderSide: BorderSide(width: borderThickness, color: indicatorColor),
      insets: EdgeInsets.symmetric(horizontal: horizontalInset));
}
