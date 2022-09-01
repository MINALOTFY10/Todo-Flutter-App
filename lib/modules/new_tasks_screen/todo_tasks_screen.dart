import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_down_button/pull_down_button.dart';
import '../../layout/Bloc/app_cubit.dart';
import '../../layout/Bloc/app_states.dart';
import 'todo_builder.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: cubit.sortBy == 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Spacer(),
                                  const Text(
                                    "sort by",
                                    style: TextStyle(
                                        color: Color.fromRGBO(8, 135, 236, 20),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: PullDownButton(
                                      itemBuilder: (context) => [
                                        PullDownMenuItem(
                                          title: 'Priority',
                                          onTap: () {
                                            cubit.changeSortBy(0);
                                          },
                                        ),
                                        const PullDownMenuDivider(),
                                        PullDownMenuItem(
                                          title: 'Category',
                                          onTap: () {
                                            cubit.changeSortBy(1);
                                          },
                                        ),
                                      ],
                                      position: PullDownMenuPosition.under,
                                      buttonBuilder: (context, showMenu) =>
                                          CupertinoButton(
                                        onPressed: showMenu,
                                        padding: EdgeInsets.zero,
                                        child: const Icon(
                                            Icons.keyboard_arrow_down_outlined),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),

                              cubit.toDoTaskListDb.isNotEmpty ?
                              Column(
                                children: [
                                  cubit.highPriorityTaskListDb.isNotEmpty ?
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "High Priority",
                                        style: TextStyle(
                                            fontSize: 22, fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      toDoTaskBuilder(
                                        context: context,
                                        tasks: cubit.highPriorityTaskListDb,
                                      ),
                                    ],
                                  ) : SizedBox(),

                                  const SizedBox(
                                    height: 25,
                                  ),
                                  cubit.mediumPriorityTaskListDb.isNotEmpty ?
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Medium Priority",
                                        style: TextStyle(
                                            fontSize: 22, fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      toDoTaskBuilder(
                                        context: context,
                                        tasks: cubit.mediumPriorityTaskListDb,
                                      ),
                                    ],
                                  ) : SizedBox(),

                                  const SizedBox(
                                    height: 25,
                                  ),
                                  cubit.lowPriorityTaskListDb.isNotEmpty ?
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Low Priority",
                                        style: TextStyle(
                                            fontSize: 22, fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      toDoTaskBuilder(
                                        context: context,
                                        tasks: cubit.lowPriorityTaskListDb,
                                      ),
                                    ],
                                  ) : SizedBox(),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ) : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 90,
                                  ),
                                  SizedBox(
                                      width: 220,
                                      height: 220,
                                      child: Image.asset(
                                        "assets/Frame.png",
                                        fit: BoxFit.fill,
                                      )),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Center(
                                      child: Text(
                                        "No Tasks Right Now",
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                      )),
                                  //SizedBox(height: 150,),
                                ],
                              )


                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Spacer(),
                                  const Text(
                                    "sort by",
                                    style: TextStyle(
                                        color: Color.fromRGBO(8, 135, 236, 20),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: PullDownButton(
                                      itemBuilder: (context) => [
                                        PullDownMenuItem(
                                          title: 'Priority',
                                          onTap: () {
                                            cubit.changeSortBy(0);
                                          },
                                        ),
                                        const PullDownMenuDivider(),
                                        PullDownMenuItem(
                                          title: 'Category',
                                          onTap: () {
                                            cubit.changeSortBy(1);
                                          },
                                        ),
                                      ],
                                      position: PullDownMenuPosition.under,
                                      buttonBuilder: (context, showMenu) =>
                                          CupertinoButton(
                                        onPressed: showMenu,
                                        padding: EdgeInsets.zero,
                                        child: const Icon(
                                            Icons.keyboard_arrow_down_outlined),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),

                              cubit.toDoTaskListDb.isNotEmpty ?
                              Column(
                                children: [
                                  cubit.personalTaskListDb.isNotEmpty ?
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Personal",
                                        style: TextStyle(
                                            fontSize: 22, fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      toDoTaskBuilder(
                                        context: context,
                                        tasks: cubit.personalTaskListDb,
                                      ),
                                    ],
                                  ) : const SizedBox(),

                                  const SizedBox(
                                    height: 25,
                                  ),
                                  cubit.businessTaskListDb.isNotEmpty ?
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Business",
                                        style: TextStyle(
                                            fontSize: 22, fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      toDoTaskBuilder(
                                        context: context,
                                        tasks: cubit.businessTaskListDb,
                                      ),
                                    ],
                                  ) : const SizedBox(),

                                  const SizedBox(
                                    height: 25,
                                  ),
                                  cubit.otherTaskListDb.isNotEmpty ?
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Other",
                                        style: TextStyle(
                                            fontSize: 22, fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      toDoTaskBuilder(
                                        context: context,
                                        tasks: cubit.otherTaskListDb,
                                      ),
                                    ],
                                  ) : const SizedBox(),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ) : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 90,
                                  ),
                                  SizedBox(
                                      width: 220,
                                      height: 220,
                                      child: Image.asset(
                                        "assets/Frame.png",
                                        fit: BoxFit.fill,
                                      )),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Center(
                                      child: Text(
                                        "No Tasks Right Now",
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                      )),
                                  //SizedBox(height: 150,),
                                ],
                              )
                            ],
                          )),
              ),
            ],
          ),
        );
      },
    );
  }
}
