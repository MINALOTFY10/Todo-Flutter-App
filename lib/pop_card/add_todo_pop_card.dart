import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout/Bloc/app_cubit.dart';
import '../layout/Bloc/app_states.dart';

const String heroAddTodo = 'add-todo-hero';

class AddTodoPopupCard extends StatelessWidget {
  AddTodoPopupCard({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Hero(
                tag: heroAddTodo,
                child: Material(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 20, right: 20, bottom: 5),
                          child: SizedBox(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: cubit.firstPrimaryColor(),
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20)),
                                      ),
                                      child: const Center(
                                        child: Text("Details",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      )),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: cubit.secondPrimaryColor(),
                                      ),
                                      child: const Center(
                                        child: Text("Tags",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      )),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: cubit.thirdPrimaryColor(),
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                      ),
                                      child: const Center(
                                        child: Text("Deadline",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        cubit.screens(context, cubit.currentIndex),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
