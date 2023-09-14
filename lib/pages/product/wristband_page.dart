import 'package:flutter/material.dart';

class WristbandPage extends StatefulWidget {
  const WristbandPage({super.key});

  @override
  State<WristbandPage> createState() => _WristbandPageState();
}

class _WristbandPageState extends State<WristbandPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("BİLEKLİKLER"),
      ),
    );
  }
}
