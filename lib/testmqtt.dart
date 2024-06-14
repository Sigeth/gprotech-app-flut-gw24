import "dart:convert";

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class TestMQTT extends StatefulWidget {

  const TestMQTT({super.key});

  @override
  State<TestMQTT> createState() => _TestMQTTState();
}

class _TestMQTTState extends State<TestMQTT> {
  late MqttServerClient client;

  @override
  void initState() {
    super.initState();
    connectClient();
  }

  @override
  Widget build(BuildContext context) {

    try {
      return Scaffold(

        appBar: AppBar(
          title: Text("TestMQTT"),
        ),
        body: StreamBuilder<List<MqttReceivedMessage<MqttMessage>>>(
          stream: client.updates, // Receive MQTT updates
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final updates = snapshot.data!;
            final latestUpdate = updates.last.payload as MqttPublishMessage;
            final payloadMessage = MqttPublishPayload.bytesToStringAsString(latestUpdate.payload.message);
            final prediction = json.decode(payloadMessage)["prediction"];
            if (prediction != null) {
              return Center(child: Text('Latest prediction: ${prediction.floor()}%'));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      );
    } catch(e) {
      return Scaffold(
          appBar: AppBar(
            title: Text("TestMQTT"),
          ),
          body: const Center(
            child: CircularProgressIndicator()
          )
      );
    }
  }

  Future<void> connectClient() async {
    final client = MqttServerClient.withPort('broker.hivemq.com', 'appPhoneGprotech', 1883); // Replace with your broker's address
    client.keepAlivePeriod = 30;
    client.autoReconnect = true;
    await client.connect('casque01').onError((e, stack) {
      debugPrint("Error connecting to MQTT : $e");
    }); // Replace with a unique client ID
    client.subscribe("python/topic", MqttQos.atMostOnce);

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

}
