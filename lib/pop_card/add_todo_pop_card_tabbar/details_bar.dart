import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/Bloc/app_cubit.dart';
import '../../layout/Bloc/app_states.dart';
import '../../layout/app_layout.dart';

var titleController = TextEditingController();
var descriptionController = TextEditingController();
var formKey = GlobalKey<FormState>();

Widget detailsBar(context) {
  AppCubit cubit = AppCubit.get(context);
  return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text("Title",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(24, 49, 79, 1))),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: titleController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      focusColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2,
                            color: Color.fromRGBO(24, 49, 79, 1),
                            style: BorderStyle.solid),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2,
                            color: Color.fromRGBO(24, 49, 79, 1),
                            style: BorderStyle.solid),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2,
                            color: Color.fromRGBO(24, 49, 79, 1),
                            style: BorderStyle.solid),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("Description",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(24, 49, 79, 1))),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    maxLines: 8,
                    minLines: 3,
                    decoration: InputDecoration(
                      // contentPadding: const EdgeInsets.all(60),
                      focusColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2,
                            color: Color.fromRGBO(24, 49, 79, 1),
                            style: BorderStyle.solid),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2,
                            color: Color.fromRGBO(24, 49, 79, 1),
                            style: BorderStyle.solid),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            width: 2,
                            color: Color.fromRGBO(24, 49, 79, 1),
                            style: BorderStyle.solid),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Expanded(child: SizedBox()),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppLayout(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Color.fromRGBO(24, 49, 79, 1),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 110,
                            height: 32,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.save(titleController.text,
                                      descriptionController.text);
                                  cubit.changePage(1);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(24, 49, 79, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: const Center(
                                  child: Text(
                                "Next",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                            ),
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
          ),
        );
      });
}
