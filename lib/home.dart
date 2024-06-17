import 'package:flutter/material.dart';
import 'bluetooth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 116, 222, 122), // Light green background color
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    settings: const RouteSettings(name: "ConnectBluetoothView"),
                    builder: (ctx) => const BluetoothConnectView()
                )
            );
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: unitHeightValue*4),
                const Text(
                  'G-Protech',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                Image(image: const AssetImage("assets/gprotech-logo.png"), height: unitHeightValue*25),
                SizedBox(height: unitHeightValue*8),
                Image(image: const AssetImage("assets/isen-logo.png"), height: unitHeightValue*18),
                Image(image: const AssetImage("assets/veolia-logo.png"), height: unitHeightValue*18),
              ],
            ),
          ),
        ),
      bottomNavigationBar: Image(image: const AssetImage("assets/gw24-logo.png"), height: unitHeightValue*12)
    );
  }
}
