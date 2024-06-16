import 'package:flutter/material.dart';

class FinalResult extends StatefulWidget {
  const FinalResult({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FinalResultState createState() => _FinalResultState();
}

class _FinalResultState extends State<FinalResult> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      body: const Center(
        child: Text(
              '29% de déchets indésirables',
              style: const TextStyle(fontSize: 20)
            ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Couleur du bouton
          ),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName("TypeDechets"));
          },
          child: const Text(
            'Terminer l\'analyse',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
