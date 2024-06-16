import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'typedechets.dart';


class BluetoothConnectView extends StatelessWidget {
  const BluetoothConnectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor : Color.fromARGB(255, 158, 244, 201),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/bluetooth.svg",
                  height: 500,
                  width: 500,
                ),
                const Text(
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

