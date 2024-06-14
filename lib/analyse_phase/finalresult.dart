import 'package:flutter/material.dart';

class FinalResult extends StatefulWidget {
  const FinalResult({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FinalResultState createState() => _FinalResultState();
}

class _FinalResultState extends State<FinalResult> {
  double _progress = 0.0;
  bool _isAnalysisComplete = false;

  @override
  void initState() {
    super.initState();
    _startAnalysis();
  }

  void _startAnalysis() async {
    // Simule une progression de l'analyse
    while (_progress < 1.0) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _progress += 0.1;
      });
    }
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
              '29% de dechets indésirable',
              style: const TextStyle(fontSize: 20)
            ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Couleur du bouton
          ),
          onPressed: _isAnalysisComplete ? () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          } : null, // Désactive le bouton si l'analyse n'est pas terminée
          child: const Text(
            'Terminer l\'analyse',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
