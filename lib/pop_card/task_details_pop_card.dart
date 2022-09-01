import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout/Bloc/app_cubit.dart';
import '../layout/Bloc/app_states.dart';
import '../models/tasks_model.dart';

class TaskDetailsCard extends StatelessWidget {
  TaskModel model;

  TaskDetailsCard({required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Material(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Spacer(),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 15, top: 15),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(Icons.close)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Details",
                                    style: TextStyle(
                                        color: Color.fromRGBO(24, 49, 79, 2),
                                        fontSize: 21,
                                        fontWeight: FontWeight.w800)),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.pending_actions)
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text("Title",
                                style: TextStyle(
                                    color: Color.fromRGBO(24, 49, 79, 2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(model.title,
                                style: const TextStyle(
                                    color: Color.fromRGBO(24, 49, 79, 70),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              height: 23,
                            ),
                            const Text("Description",
                                style: TextStyle(
                                    color: Color.fromRGBO(24, 49, 79, 2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900)),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(model.description,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(24, 49, 79, 70),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500)),
                            ),
                            const SizedBox(
                              height: 23,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Column(
                            children: [
                              const Text("Priority",
                                  style: TextStyle(
                                      color: Color.fromRGBO(24, 49, 79, 2),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800)),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 110,
                                height: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          147, 225, 216, 1),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text(model.priority,
                                          style: const TextStyle(
                                              color:
                                                  Color.fromRGBO(24, 49, 79, 1),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500))),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              const Center(
                                child: Text("Category",
                                    style: TextStyle(
                                        color: Color.fromRGBO(24, 49, 79, 2),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 110,
                                height: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: model.category == "Personal"
                                          ? const Color.fromRGBO(
                                              249, 234, 76, 1)
                                          : model.category == "Business"
                                              ? const Color.fromRGBO(
                                                  147, 225, 216, 1)
                                              : const Color.fromRGBO(
                                                  147, 225, 216, 1),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text(
                                    model.category,
                                    style: const TextStyle(
                                        color: Color.fromRGBO(24, 49, 79, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
