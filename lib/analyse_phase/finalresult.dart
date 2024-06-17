import "dart:convert";

import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class FinalResult extends StatefulWidget {
  const FinalResult({super.key});

  @override
  State<FinalResult> createState() => _FinalResultState();
}

class _FinalResultState extends State<FinalResult> {
  late MqttServerClient client;

  @override
  void initState() {
    super.initState();
    connectClient();
  }

  Future<void> connectClient() async {
    final client = MqttServerClient.withPort('broker.hivemq.com', 'appPhoneGprotech', 1883); // Replace with your broker's address
    client.keepAlivePeriod = 30;
    client.autoReconnect = false;
    await client.connect('casque01').onError((e, stack) {
      debugPrint("Error connecting to MQTT : $e");
    }); // Replace with a unique client ID
    client.subscribe("gprotech/casque1/taux", MqttQos.atLeastOnce);

    client.onConnected = () {
      debugPrint('MQTT connected');
    };

    client.onDisconnected = () {
      debugPrint('MQTT disconnected');
    };

    client.onSubscribed = (String topic) {
      debugPrint('MQTT subscribed to $topic');
    };

    this.client = client;
  }

  @override
  Widget build(BuildContext context) {

    Widget mqttUnready = const Center(
        child: CircularProgressIndicator()
    );

    late Widget analysisResultDisplayer;
    try {
      analysisResultDisplayer = StreamBuilder<List<MqttReceivedMessage<MqttMessage>>>(
          stream: client.updates, // Receive MQTT updates
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              debugPrint("No MQTT data");
              return mqttUnready;
            }
            final updates = snapshot.data!;
            debugPrint(updates.last.payload.toString());
            final latestUpdate = updates.last.payload as MqttPublishMessage;
            final payloadMessage = MqttPublishPayload.bytesToStringAsString(
                latestUpdate.payload.message);
            final double prediction = double.parse(payloadMessage);
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Text('${prediction.floor()}%',
                      style: const TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                    )),
                    const Text("de déchets indésirables",
                      style: TextStyle(
                      fontSize: 16
                    ))
                  ]
            );
          },
        );
    } catch (e) {
      debugPrint("Error : $e");
      analysisResultDisplayer = mqttUnready;
    }

    return Scaffold(
      body: Center(child: analysisResultDisplayer),
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
            style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(100, 0, 172, 20)
            ),
          ),
        ),
      ),
    );
  }
}
