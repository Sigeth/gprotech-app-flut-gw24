import 'package:flutter/material.dart';
import 'finalresult.dart';

class RunAnalyse extends StatefulWidget {
  @override
  _AnalysePageState createState() => _AnalysePageState();
}

class _AnalysePageState extends State<RunAnalyse> {
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
            backgroundColor: const Color.fromARGB(255, 200, 30, 18), // Couleur du bouton
          ),
          onPressed: _isAnalysisComplete ? () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    settings: const RouteSettings(name: "FinalResult"),
                    builder: (ctx) => const FinalResult()
                )
            );
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
