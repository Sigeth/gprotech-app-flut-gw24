import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
 
}
class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Clickstart(),
    );
  }
}

class Clickstart extends StatelessWidget {
  const Clickstart({super.key});
  void _handleTap() {
    print('Commancer l''analyse!');
    // Tu peux ajouter ici toute autre action que tu souhaites réaliser lors du clic
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Plastique'),
      ),
      backgroundColor : const Color.fromARGB(255, 158, 244, 201),
       body: GestureDetector(
        onTap: _handleTap,
        child: Container(
          color: Color.fromARGB(255, 67, 171, 75), // Couleur de fond de la page
          child: Center(
            child: Text(
              'Cliquez n\'importe où sur cette page',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
