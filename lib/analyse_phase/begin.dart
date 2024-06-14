import 'package:flutter/material.dart';

class BeginAnalysePage extends StatelessWidget {
  const BeginAnalysePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
        title: Text("Analyse de ${title.toLowerCase()}"),
      ),
      body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Gesture Detected!')));
          },
          child: Center(
              child: Text("Commencer l'analyse"),
          )
        )
    );
  }
}