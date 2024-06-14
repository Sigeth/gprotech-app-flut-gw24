import 'package:flutter/material.dart';
import 'package:gprotech_app_flut_gw24/analyse_phase/runanalyse.dart';
import 'package:gprotech_app_flut_gw24/analyse_phase/finalresult.dart';
//import 'package:flutter/typedechets.dart';
//import "bluetooth.dart";

void main() {
  runApp(MyApp());
 
}
class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FinalResult()
    );
  }
}



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor : const Color.fromARGB(255, 158, 244, 201),
      body: Center(
        child: Container(
          height :300,
          width :300,
          color :const Color.fromARGB(255, 200, 47, 36),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
            Text(
              'G-Protech',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Veolia',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          ),
        ),
      
            ),
          
        );

  }
}
