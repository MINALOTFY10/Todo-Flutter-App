import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo2/layout/Bloc/app_states.dart';
import '../../models/tasks_model.dart';
import '../../pop_card/add_todo_pop_card_tabbar/deadline_bar.dart';
import '../../pop_card/add_todo_pop_card_tabbar/details_bar.dart';
import '../../pop_card/add_todo_pop_card_tabbar/tags_bar.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<TaskModel> toDoTaskListDb =[];
  List<TaskModel> doneTaskListDb =[];
  List<TaskModel> archivedTaskListDb =[];
  List<TaskModel> highPriorityTaskListDb = [];
  List<TaskModel> mediumPriorityTaskListDb = [];
  List<TaskModel> lowPriorityTaskListDb = [];
  List<TaskModel> personalTaskListDb = [];
  List<TaskModel> businessTaskListDb = [];
  List<TaskModel> otherTaskListDb = [];
  late Database database;
  String title = "";
  String description = "";
  String priority = "";
  String category = "";
  String date = "";
  String time = "";
  int sortBy = 0;
  int priorityNumber = 0;
  int categoryNumber = 0;
  int page =0;

//======================================================================================================

  void createDatabase() {
    openDatabase(
      'todo615d5.db',
      version: 1,
      onCreate: (database, version) {
        if (kDebugMode) {
          print('database created');
        }
        database
            .execute(
            'CREATE TABLE TASK (title text, description text, priority text, category text, date text, time text, type text) ')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('database opened!!!!!!!!!!!!!!!!!');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String description,
    required String priority,
    required String category,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO TASK(title, description, priority, category, time, date, type) VALUES("$title", "$description", "$priority", "$category", "$time", "$date", "ToDo")',
      )
          .then((value) {
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
    });
  }

  void getDataFromDatabase(database) {
    toDoTaskListDb.clear();
    doneTaskListDb.clear();
    archivedTaskListDb.clear();

    highPriorityTaskListDb.clear();
    mediumPriorityTaskListDb.clear();
    lowPriorityTaskListDb.clear();

    personalTaskListDb.clear();
    businessTaskListDb.clear();
    otherTaskListDb.clear();
    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM TASK').then((value) {
      value.forEach((element) {


        if (element['priority'] == "High") {
          highPriorityTaskListDb.add(TaskModel(
            title: element['title'] as String,
            description: element['description'] as String,
            priority: element['priority'] as String,
            category: element['category'] as String,
            time: element['time'] as String,
            date: element['date'] as String,
            type: element['type'] as String,
          ));
        }
        if (element['priority'] == "Medium") {
          mediumPriorityTaskListDb.add(TaskModel(
            title: element['title'] as String,
            description: element['description'] as String,
            priority: element['priority'] as String,
            category: element['category'] as String,
            time: element['time'] as String,
            date: element['date'] as String,
            type: element['type'] as String,
          ));
        }
        if (element['priority'] == "Low") {
          lowPriorityTaskListDb.add(TaskModel(
            title: element['title'] as String,
            description: element['description'] as String,
            priority: element['priority'] as String,
            category: element['category'] as String,
            time: element['time'] as String,
            date: element['date'] as String,
            type: element['type'] as String,
          ));
        }

        if (element['category'] == "Personal") {
          personalTaskListDb.add(TaskModel(
            title: element['title'] as String,
            description: element['description'] as String,
            priority: element['priority'] as String,
            category: element['category'] as String,
            time: element['time'] as String,
            date: element['date'] as String,
            type: element['type'] as String,
          ));
        }
        if (element['category'] == "Business") {
          businessTaskListDb.add(TaskModel(
            title: element['title'] as String,
            description: element['description'] as String,
            priority: element['priority'] as String,
            category: element['category'] as String,
            time: element['time'] as String,
            date: element['date'] as String,
            type: element['type'] as String,
          ));
        }
        if (element['category'] == "Other") {
          otherTaskListDb.add(TaskModel(
            title: element['title'] as String,
            description: element['description'] as String,
            priority: element['priority'] as String,
            category: element['category'] as String,
            time: element['time'] as String,
            date: element['date'] as String,
            type: element['type'] as String,
          ));
        }

        if(element['type'] == "ToDo"){
          toDoTaskListDb.add(TaskModel(
            title: element['title'] as String,
            description: element['description'] as String,
            priority: element['priority'] as String,
            category: element['category'] as String,
            time: element['time'] as String,
            date: element['date'] as String,
            type: element['type'] as String,
          ));
        }
        if(element['type'] == "Archived"){
          archivedTaskListDb.add(TaskModel(
            title: element['title'] as String,
            description: element['description'] as String,
            priority: element['priority'] as String,
            category: element['category'] as String,
            time: element['time'] as String,
            date: element['date'] as String,
            type: element['type'] as String,
          ));
        }
        if(element['type'] == "Done"){
          doneTaskListDb.add(TaskModel(
            title: element['title'] as String,
            description: element['description'] as String,
            priority: element['priority'] as String,
            category: element['category'] as String,
            time: element['time'] as String,
            date: element['date'] as String,
            type: element['type'] as String,
          ));
        }

      });
      emit(AppGetDatabaseState());
    });
  }

  void updateDataType({
    required String type,
    required String priority,
    required String title,
  }) async {
    database.rawUpdate(
      'UPDATE TASK SET type = ?,priority = ? WHERE title = ?',
      [type, priority, title],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });

  }


  void updateDataPriority({
    required String priority,
    required String title,
  }) async {
    database.rawUpdate(
      'UPDATE TASK SET priority = ? WHERE title = ?',
      [priority, title],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteData({
    required String title,
  }) async {
    database
        .rawDelete('DELETE FROM TASK WHERE title = ?', [title]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

//======================================================================================================

  void changeSortBy(int index) {
    sortBy = index;
    emit(ChangeSortByState());
  }

  void insertDate() {
    if (priorityNumber == 0) {
      priority = "Low";
    } else if (priorityNumber == 1) {
      priority = "Medium";
    } else {
      priority = "High";
    }
    if (categoryNumber == 0) {
      category = "Personal";
    } else if (categoryNumber == 1) {
      category = "Business";
    } else {
      category = "Other";
    }

    insertToDatabase(
        title: title,
        description: description,
        date: date,
        category: category,
        time: time,
        priority: priority);
  }

  void save(String formTitle, String formDescription) {
    title = formTitle;
    description = formDescription;
  }


  void changePriorityNumber(int index) {
    priorityNumber = index;
    emit(ChangePriorityState());
  }

  Color firstPriorityColor() {
    if (priorityNumber == 0) {
      return const Color.fromRGBO(147, 225, 216, 1);
    } else {
      return const Color.fromRGBO(24, 49, 79, 1);
    }
  }

  Color secondPriorityColor() {
    if (priorityNumber == 1) {
      return const Color.fromRGBO(147, 225, 216, 1);
    } else {
      return const Color.fromRGBO(24, 49, 79, 1);
    }
  }

  Color thirdPriorityColor() {
    if (priorityNumber == 2) {
      return const Color.fromRGBO(147, 225, 216, 1);
    } else {
      return const Color.fromRGBO(24, 49, 79, 1);
    }
  }

  void changeCategoryNumber(int index) {
    categoryNumber = index;
    emit(ChangePriorityState());
  }

  Color firstCategoryColor() {
    if (categoryNumber == 0) {
      return const Color.fromRGBO(249, 234, 76, 1);
    } else {
      return const Color.fromRGBO(24, 49, 79, 1);
    }
  }

  Color secondCategoryColor() {
    if (categoryNumber == 1) {
      return const Color.fromRGBO(184, 79, 79, 1);
    } else {
      return const Color.fromRGBO(24, 49, 79, 1);
    }
  }

  Color thirdCategoryColor() {
    if (categoryNumber == 2) {
      return const Color.fromRGBO(5, 214, 159, 1);
    } else {
      return const Color.fromRGBO(24, 49, 79, 1);
    }
  }


  int currentIndex = 0;

  Widget screens(context, int index) {
    if (index == 0) {
      return detailsBar(context);
    }
    if (index == 1) {
      return tagsBar(context);
    } else {
      return const DeadlineBar();
    }
  }

  void changePage(int index) {
    currentIndex = index;
    emit(ForumChangePageState());
  }

  Color firstPrimaryColor() {
    if (currentIndex == 0) {
      return const Color.fromRGBO(115, 160, 212, 1);
    } else {
      return const Color.fromRGBO(24, 49, 79, 1);
    }
  }

  Color secondPrimaryColor() {
    if (currentIndex == 1) {
      return const Color.fromRGBO(115, 160, 212, 1);
    } else {
      return const Color.fromRGBO(24, 49, 79, 1);
    }
  }

  Color thirdPrimaryColor() {
    if (currentIndex == 2) {
      return const Color.fromRGBO(115, 160, 212, 1);
    } else {
      return const Color.fromRGBO(24, 49, 79, 1);
    }
  }
}
