import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:3), (){
         Navigator.pushReplacementNamed(context, AppRoutes.ROUTE_MAIN);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Center(child: Image.asset("assets/images/todo_logos.png",
            height:200,
            width:200,
    
          ))
        ],
      ),
    );
  }
}