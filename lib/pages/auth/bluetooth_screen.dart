import 'dart:async';

import 'package:app_train/widgets/button.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothScreen extends StatefulWidget {
  const BluetoothScreen({super.key});

  @override
  State<BluetoothScreen> createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  late String data = '';
  late AudioPlayer player = AudioPlayer();
  BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;

  late StreamSubscription<BluetoothAdapterState> _streamSubscription;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();

    player.setReleaseMode(ReleaseMode.stop);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player.setSource(AssetSource('audio/sample.mp3'));
      await player.resume();
    });

    _streamSubscription = FlutterBluePlus.adapterState.listen((state) {
      _adapterState = state;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Text('Bluetooth Devices'),
          Text(_adapterState == BluetoothState.on ? 'ON' : 'OFF'),
          Text(data),
          Button(
              text: 'Connect',
              onPressed: () async {
                print(_adapterState);
              }),
          Button(
              text: 'Play',
              onPressed: () {
                player.resume();
              }),
          Button(
              text: 'Stop',
              onPressed: () {
                player.stop();
              })
        ],
      )),
    );
  }
}
