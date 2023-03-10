import 'package:flutter/cupertino.dart';

import '../../assets/widgets/listtile.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, int index) {
            return NotesListTile(
                title: "Note Title",
                subTitle: "Date",
                onPressDelete: () {},
                onPressFavorite: () {});
          }),
    );
  }
}
