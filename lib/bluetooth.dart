import 'package:flutter/material.dart';
import 'typedechets.dart';


class BluetoothConnectView extends StatelessWidget {
  const BluetoothConnectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    settings: const RouteSettings(name: "TypeDechets"),
                    builder: (ctx) => TypeDechets()
                )
            );
          },
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.bluetooth,
                  size: 120,
                  color: Colors.grey,
                ),
                Text(
                  'Connectez vous au bluetooth !',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
      )
    );
  }
}

