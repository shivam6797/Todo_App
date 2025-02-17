import 'package:flutter/material.dart';
import 'package:todo_app/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Poppins"
      ),
      initialRoute: AppRoutes.ROUTE_SPLASH,
      routes: AppRoutes.getRoutes(),
    );
  }
}
