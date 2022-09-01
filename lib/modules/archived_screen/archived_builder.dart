import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/Bloc/app_cubit.dart';
import '../../layout/Bloc/app_states.dart';
import '../../models/tasks_model.dart';
import '../../pop_card/hero_dialog_route.dart';
import '../../pop_card/task_details_pop_card.dart';
import '../../shared/snack_bar.dart';
import 'archived_tasks_screen.dart';

Widget archivedTaskBuilder({required List<TaskModel> tasks, required context}) {
  return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ConditionalBuilder(
        condition: tasks.isNotEmpty,
        builder: (context) => ListView.separated(
          physics:const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              _builtTaskItem(tasks[index], tasks, index, context),
          itemCount: tasks.length,
          separatorBuilder: (context, index) => const SizedBox(
            width: double.infinity,
            height: 15,
          ),
        ),
        fallback: ((context) => Column(
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
            )),
      ));
}

Widget _builtTaskItem(TaskModel model, tasks, index, context) {
  AppCubit cubit = AppCubit.get(context);
  return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return model.type == "Archived"
            ? InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(HeroDialogRoute(builder: (context) {
                    return TaskDetailsCard(
                      model: model,
                    );
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(240, 244, 250, 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 5,
                          height: 53,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(184, 76, 77, 1),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              child: Text(
                                model.title,
                                maxLines: 1,
                                style: const TextStyle(
                                    color: Color.fromRGBO(24, 49, 79, 1),
                                    fontSize: 23,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              model.date,
                              style: const TextStyle(
                                  color: Color.fromRGBO(24, 49, 79, 50),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                            // Text(model.time, style: TextStyle(color: Colors.amber[800], fontSize: 15)),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              cubit.updateDataType(
                                  type: 'Done',priority: model.priority, title: model.title);
                              cubit.page = 1;
                              snackBarMessage(context, "Task is done", true);
                            },
                            icon: const Icon(Icons.done_rounded)),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const SizedBox(width: 0.0, height: 0.0);
      });
}
