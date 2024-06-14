import 'package:flutter/material.dart';
import 'analyse_phase/begin.dart'; // Importez votre fichier being.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Type de Déchets',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Typedechets(),
    );
  }
}

class Typedechets extends StatelessWidget {
  final List<String> dechets = [
    'Plastique',
    'Papier',
    'Verre',
    'Carton',
  ];

  Typedechets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Type de Déchets'),
       
      ),
      body: ListView.builder(
        itemCount: dechets.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dechets[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BeginAnalysePage(title: dechets[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
