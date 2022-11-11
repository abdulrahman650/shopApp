import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bmiResultScreen extends StatelessWidget {


  final int result;
  final bool isMale;
  final int age;

  bmiResultScreen({
    required this.result,
  required this.isMale,
    required this.age,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Gender : ${isMale ? 'Male' : 'Famle'}",
              style:TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold) ,),
            Text("Result : $result",
              style:TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold) ,),
            Text("Age : $age",
              style:TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold) ,),

          ],
        ),
      ),
    );
  }
}
