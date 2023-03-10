import 'package:flutter/material.dart';
import 'package:notesapp/assets/widgets/text.dart';

class NotesListTile extends StatelessWidget {
  double margin;
  double contentPaddingHorizontal;
  double contentPaddingVertical;
  String title;
  String subTitle;
  VoidCallback onPressDelete;
  VoidCallback onPressFavorite;

  NotesListTile(
      {required this.title,
      required this.subTitle,
      required this.onPressDelete,
      required this.onPressFavorite,
      this.contentPaddingVertical = 4.0,
      this.contentPaddingHorizontal = 14.0,
      this.margin = 16.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(margin),
      child: ListTile(
          contentPadding: EdgeInsets.symmetric(
              horizontal: contentPaddingHorizontal,
              vertical: contentPaddingVertical),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: TitleText(
            text: title,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          subtitle: NormalHintText(text: subTitle),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: onPressFavorite, icon: Icon(Icons.favorite)),
              IconButton(onPressed: onPressDelete, icon: Icon(Icons.delete)),
            ],
          )),
    );
  }
}
