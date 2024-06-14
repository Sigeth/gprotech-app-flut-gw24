import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
 
}
class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Startanalyse()
    );//MaterialApp
  }
}

class Startanalyse extends StatelessWidget {
  const Startanalyse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Plastique'),
      ),
      backgroundColor : const Color.fromARGB(255, 158, 244, 201),
      body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
            Text(
              'Commancer l''analyse !',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
             ],
          ),
        ),
      
            );//Scaffold
          

  }
}
