import 'package:flutter/material.dart';
import 'analyse_phase/begin.dart'; // Importez votre fichier begin.dart

void main() {
  runApp(const MyApp());
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

   //Typedechets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Type de Déchets'),
        backgroundColor: Colors.green, // Couleur de fond de l'AppBar
  
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: dechets.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 4,
            child: ListTile(
              leading: const Icon(
                Icons.recycling,
                color: Colors.green,
              ),
              title: Text(dechets[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BeginAnalysePage(title: dechets[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
