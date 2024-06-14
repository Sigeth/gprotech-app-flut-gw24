import 'package:flutter/material.dart';

class Runanalyse extends StatefulWidget {
  @override
  _AnalysePageState createState() => _AnalysePageState();
}

class _AnalysePageState extends State<Runanalyse> {
  bool _isAnalysisComplete = false;

  @override
  void initState() {
    super.initState();
    _startAnalysis();
  }

  void _startAnalysis() async {
    // Simule une analyse longue
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      _isAnalysisComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      body: const Center(
        child: Text(
          'Analyse en cours...',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 200, 30, 18), // Couleur du bouton
          ),
          onPressed: _isAnalysisComplete ? () {
            Navigator.pop(context); // Ferme la page ou effectue une action
          } : null, // Désactive le bouton si l'analyse n'est pas terminée
          child: const Text(
            'Terminer',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
