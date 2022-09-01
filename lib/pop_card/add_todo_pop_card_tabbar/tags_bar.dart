import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/Bloc/app_cubit.dart';
import '../../layout/Bloc/app_states.dart';

Widget tagsBar(context) {
  AppCubit cubit = AppCubit.get(context);
  return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Priority",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 110,
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.changePriorityNumber(0);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: cubit.firstPriorityColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          "low",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 110,
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.changePriorityNumber(1);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: cubit.secondPriorityColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          "medium",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 110,
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.changePriorityNumber(2);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: cubit.thirdPriorityColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          "high",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Category",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 110,
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.changeCategoryNumber(0);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: cubit.firstCategoryColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          "Personal",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 110,
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.changeCategoryNumber(1);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: cubit.secondCategoryColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          "Business",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 110,
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.changeCategoryNumber(2);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: cubit.thirdCategoryColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          "Other",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Expanded(child: SizedBox()),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          cubit.changePage(0);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          "Back",
                          style: TextStyle(
                              color: Color.fromRGBO(24, 49, 79, 1),
                              fontSize: 16),
                        )),
                      ),
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 110,
                        height: 28,
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.changePage(2);
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
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      });
}
