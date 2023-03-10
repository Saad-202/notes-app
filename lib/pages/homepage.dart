//dummy number for developing
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/authentication/auth_services.dart';
import 'package:notesapp/pages/todo/todo_page.dart';

import '../assets/widgets/buttons.dart';
import '../assets/widgets/custom_appbar.dart';
import '../assets/widgets/tabbar.dart';
import '../assets/widgets/tabbar_view.dart';
import 'notes/add_or_update.dart';
import 'notes/empty_notes_page.dart';
import 'notes/notes_page.dart';

int numberOfNotes = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      floatingActionButton: numberOfNotes >= 1
          ? FloatingButton(
              onPress: () {
                Navigator.of(context).pushNamed('/add_or_update');
              },
              icon: Icons.add,
            )
          : null,
      appBar: CustomAppBar(
        actionItems: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.search),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text("Sign out"),
                      onTap: () async {
                        await AuthServices.firebase().logout();
                        await AuthServices.firebase().currentState();
                      },
                    ),
                  ];
                },
              )),
        ],
        title: "Notes",
      ),
      body: Column(children: [
        CustomTabBar(
          firstItem: 'Notes',
          secondItem: 'To Do',
          tabController: _tabController,
        ),
        CustomTabBarView(
            tabController: _tabController,
            notesPage: numberOfNotes == 0 ? EmptyNotesPage() : NotesPage(),
            toDoPage: ToDoPage())
      ]),
    );
  }
}
