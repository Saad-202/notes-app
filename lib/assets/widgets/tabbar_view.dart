import 'package:flutter/material.dart';

class CustomTabBarView extends StatelessWidget {
  TabController tabController;
  Widget notesPage;
  Widget toDoPage;
  CustomTabBarView(
      {required this.tabController,
      required this.notesPage,
      required this.toDoPage});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(controller: tabController, children: [
        notesPage,
        toDoPage,
      ]),
    );
  }
}
