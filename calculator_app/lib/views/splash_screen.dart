

import 'dart:async';

import 'package:calculator_app/utils/strings.dart';
import 'package:calculator_app/views/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    startTime(context);
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.calculate,
              size: 48.0,
              color: Colors.white,
            ),
            SizedBox(width: 0,height: 50,),
            Text(AppStrings.app_name,textAlign: TextAlign.center,style: TextStyle(decoration:TextDecoration.none,fontSize: 40.0,fontWeight: FontWeight.w900,color: Colors.white),)
          ],
        ),
      ),
    );
  }
  startTime(BuildContext context)async{
    Timer(Duration(seconds: 3),(){navigationPage(context);});
  }

  navigationPage(BuildContext context){
    Navigator.pushReplacement(context,MaterialPageRoute(
        builder: (context) => HomeScreen()));
  }
}
