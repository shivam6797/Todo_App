import 'package:flutter/cupertino.dart';
import 'package:todo_app/spalsh_screen.dart';
import 'package:todo_app/ui/available_task_screen.dart';
import 'package:todo_app/ui/create_account_screen.dart';
import 'package:todo_app/ui/home_screen.dart';
import 'package:todo_app/ui/main_screen.dart';
import 'package:todo_app/ui/new_task_screen.dart';
import 'package:todo_app/ui/notification_screen.dart';
import 'package:todo_app/ui/ongoing_process.dart';
import 'package:todo_app/ui/profile_screen.dart';
import 'package:todo_app/ui/task_overview_screen.dart';
import 'package:todo_app/ui/task_screen.dart';

class AppRoutes{
  static const String ROUTE_SPLASH = "/";
  static const String ROUTE_MAIN = "/main";
  static const String ROUTE_HOME = "/home";
  static const String ROUTE_TASK_SCREEN = "/task";
  static const String ROUTE_CREATE_ACCOUNT = "/create_account";
  static const String ROUTE_NEW_TASK = "/new_task";
  static const String ROUTE_ONGOING_PROCESS = "/ongoing_process";
  static const String ROUTE_AVAILABEL_TASK = "/availabel_task";
  static const String ROUTE_TASK_OVERVIEW = "/task_overview";
  static const String ROUTE_NOTIFICATION = "/notification";
  static const String ROUTE_PROFILE = "/profile";


  static Map<String,WidgetBuilder> getRoutes() => {
      ROUTE_SPLASH:(context) => SplashScreen(),
      ROUTE_MAIN:(context) => MainScreen(),
      ROUTE_HOME:(context) => HomeScreen(),
      ROUTE_TASK_SCREEN:(context) => TaskScreen(),
      ROUTE_CREATE_ACCOUNT:(context) => CreateAccountScreen(),
      ROUTE_NEW_TASK:(context) => NewTaskScreen(),
      ROUTE_ONGOING_PROCESS:(context) => OngoingProcessScreen(),
      ROUTE_AVAILABEL_TASK:(context) => AvailabelTaskScreen(),
      ROUTE_TASK_OVERVIEW:(context) => TaskOverviewScreen(),
      ROUTE_NOTIFICATION:(context) => NotificationScreen(),
      ROUTE_PROFILE:(context) => ProfileScreen(),

  };

}