import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../layout/Bloc/app_cubit.dart';
import '../../layout/Bloc/app_states.dart';
import '../../layout/app_layout.dart';

class DeadlineBar extends StatefulWidget {
  const DeadlineBar({
    Key? key,
  }) : super(key: key);

  @override
  State<DeadlineBar> createState() => _DeadlineBarState();
}

class _DeadlineBarState extends State<DeadlineBar> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;

  // Select for Date
  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

// Select for Time
  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  // select date time picker
  Future _selectDateTime(BuildContext context) async {
    final date = await _selectDate(context);
    if (date == null) return;

    final time = await _selectTime(context);

    if (time == null) return;
    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  String getDateTime() {
    // ignore: unnecessary_null_comparison
    if (dateTime == null) {
      return 'select date timer';
    } else {
      return DateFormat('yyyy-MM-dd HH: ss a').format(dateTime);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  var dateController = TextEditingController();
  var timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Date",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(24, 49, 79, 1))),
                  const SizedBox(
                    height: 8,
                  ),
                  showDate
                      ? InkWell(
                          onTap: () {
                            _selectDate(context);
                            showDate = true;
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                // Red border with the width is equal to 5
                                border: Border.all(
                                  width: 2,
                                  color: const Color.fromRGBO(24, 49, 79, 1),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              getDate(),
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            )),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            _selectDate(context);
                            showDate = true;
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                // Red border with the width is equal to 5
                                border: Border.all(
                                  width: 2,
                                  color: const Color.fromRGBO(24, 49, 79, 1),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Time",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(24, 49, 79, 1))),
                  const SizedBox(
                    height: 8,
                  ),
                  showTime
                      ? InkWell(
                          onTap: () {
                            _selectTime(context);
                            showTime = true;
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                // Red border with the width is equal to 5
                                border: Border.all(
                                  width: 2,
                                  color: const Color.fromRGBO(24, 49, 79, 1),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(getTime(selectedTime),
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500))),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            _selectTime(context);
                            showTime = true;
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                // Red border with the width is equal to 5
                                border: Border.all(
                                  width: 2,
                                  color: const Color.fromRGBO(24, 49, 79, 1),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                  const SizedBox(
                    height: 50,
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
                              cubit.changePage(1);
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
                        Expanded(
                          child: SizedBox(
                            width: 110,
                            height: 33,
                            child: ElevatedButton(
                              onPressed: () {
                                cubit.date = getDate();
                                cubit.time = getTime(selectedTime);
                                cubit.insertDate();
                                cubit.changePage(0);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AppLayout(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(24, 49, 79, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: const Center(
                                  child: Text(
                                "Save",
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
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
