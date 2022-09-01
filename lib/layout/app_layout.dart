import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/pop_card/add_todo_pop_card.dart';
import 'package:todo2/pop_card/hero_dialog_route.dart';
import '../modules/archived_screen/archived_tasks_screen.dart';
import '../modules/done_tasks_screen/done_tasks_screen.dart';
import '../modules/new_tasks_screen/todo_tasks_screen.dart';
import '../nav_bar/nav_bar.dart';
import 'Bloc/app_cubit.dart';
import 'Bloc/app_states.dart';

class AppLayout extends StatelessWidget {
  AppLayout({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            key: _key,
            drawer: const NavBar(),
            extendBody: true,
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Container(
                  color: const Color.fromRGBO(24, 49, 79, 1),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                _key.currentState!.openDrawer();
                              },
                              child: const Icon(
                                Icons.menu_rounded,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 20, left: 10),
                              child: Icon(
                                Icons.notifications_none,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: DefaultTabController(
                      length: 3,
                      child: Column(children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 0, top: 5),
                          child: SizedBox(
                            height: 45,
                            child: TabBar(
                              indicatorColor: Colors.transparent,
                              labelColor: Color.fromRGBO(24, 49, 79, 1),
                              labelStyle: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w900),
                              tabs: [
                                Tab(
                                  child: Text("To do"),
                                ),
                                Tab(
                                  child: Text("Archived"),
                                ),
                                Tab(
                                  child: Text("Done"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 5,
                          color: Color.fromRGBO(24, 49, 79, 1),
                        ),
                        Expanded(
                          child: TabBarView(children: [
                            NewTasksScreen(),
                            ArchivedTasksScreen(),
                            DoneTasksScreen()
                          ]),
                        )
                      ])),
                ),
              ],
            ),
              floatingActionButton: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(HeroDialogRoute(builder: (context) {
                      return AddTodoPopupCard();
                    }));
                  },
                  child: Hero(
                    tag: heroAddTodo,
                    child: SizedBox(
                      height: 55,
                      width: 55,
                      child: Material(
                        color: const Color.fromRGBO(24, 49, 79, 1),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: const Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                    ),
                  )));

        });
  }
}
