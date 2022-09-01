import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/Bloc/app_cubit.dart';
import '../../layout/Bloc/app_states.dart';
import '../../models/tasks_model.dart';
import '../../pop_card/hero_dialog_route.dart';
import '../../pop_card/task_details_pop_card.dart';
import '../../shared/snack_bar.dart';

Widget toDoTaskBuilder({required List<TaskModel> tasks, required context}) {
  return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ConditionalBuilder(
        condition: tasks.isNotEmpty,
        builder: (context) => ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) =>
              _builtTaskItem(tasks[index], tasks, index, context),
          itemCount: tasks.length,
          separatorBuilder: (context, index) => const SizedBox(
            width: double.infinity,
            height: 15,
          ),
        ),
        fallback: ((context) => const SizedBox()),
      ));
}

Widget _builtTaskItem(TaskModel model, tasks, index, context) {
  AppCubit cubit = AppCubit.get(context);
  return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return model.type == "ToDo"
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
                            Container(
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
                                  type: 'Done',priority: "priority", title: model.title);
                              // cubit.updateDataPriority(
                              //     priority: 'Priority', title: model.title);
                              snackBarMessage(context, "Task is done", true);
                            },
                            icon: const Icon(Icons.done_rounded)),
                        IconButton(
                            onPressed: () {
                              cubit.updateDataType(
                                  type: 'Archived',priority: "priority", title: model.title);
                              // cubit.updateDataPriority(
                              //     priority: 'Priority', title: model.title);
                              snackBarMessage(
                                  context, "Task is archived", true);
                            },
                            icon: const Icon(Icons.archive_outlined)),
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
