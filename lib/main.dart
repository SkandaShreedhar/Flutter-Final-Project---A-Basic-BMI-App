import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myfirstapp/SecondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double height = 100;
  double weight = 100;
  double result = 0;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 150,
            width: 490,
            color: Colors.white24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT : ${height.round()} cms",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                  ),
                ),
                Slider(
                    value: height,
                    min: 50,
                    max: 250,
                    onChanged: (value) {
                  setState(
                          (){
                        height = value;
                      }
                  );
                })
              ],
            ),
          ),
          Container(
            height: 80,
            width: 490,
            color: Colors.white24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "WEIGHT : ${weight.round()} kgs",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 490,
            color: Colors.white24,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                ElevatedButton(
                onPressed: () {
                  setState(() {
                    weight++;
                  });
                },
            child: Text(
                "+",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50), // <-- Radius
              ),
            ),
          ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        weight--;
                      });
                    },
                    child: Text(
                        '-',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // <-- Radius
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Container(
            height: 80,
            width: 490,
            color: Colors.white24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      result = weight / (height*height/10000);
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                        SecondPage(result : result,)));


          },
                  child: Text(
                      'Calculate',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 40,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                )
              ],
            ),
          ),
         ],
        )
      );
   }
}
