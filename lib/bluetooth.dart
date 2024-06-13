import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(Bluetooth());
 
}
class Bluetooth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Connect()
    );
  }
}


class Connect extends StatelessWidget {
  const Connect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor : Color.fromARGB(255, 158, 244, 201),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
              Image.asset('assets/bluetooth.svg'),
            Text(
              'Connectez vous au bluetooth !',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
          ),
        ),
      
            );

  }
}

