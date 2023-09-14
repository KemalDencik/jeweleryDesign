import 'package:flutter/material.dart';

class NecklacePage extends StatefulWidget {
  const NecklacePage({super.key});

  @override
  State<NecklacePage> createState() => _NecklacePageState();
}

class _NecklacePageState extends State<NecklacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("KOLYELER"),
      ),
    );
  }
}
