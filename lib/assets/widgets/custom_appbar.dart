import 'package:flutter/material.dart';
import 'package:notesapp/assets/widgets/text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  List<Widget>? actionItems;
  Widget? leadingWidget;
  double height;

  CustomAppBar({
    required this.title,
    this.actionItems,
    this.leadingWidget,
    this.height = 60.0,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: height,
      title: TitleText(text: title),
      actions: actionItems,
      leading: leadingWidget,
    );
  }
}
