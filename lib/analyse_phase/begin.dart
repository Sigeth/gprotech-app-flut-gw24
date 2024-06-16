import 'package:flutter/material.dart';
import 'runanalyse.dart';

class BeginAnalysePage extends StatelessWidget {
  const BeginAnalysePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Analyse de ${title.toLowerCase()}"),
        backgroundColor: Colors.green,
      ),
      body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    settings: const RouteSettings(name: "RunAnalyse"),
                    builder: (ctx) => RunAnalyse()
                )
            );
          },
          child: const Center(
              child: Text("Commencer l'analyse", style: TextStyle(fontSize: 24)),
          )
        )
    );
  }
}