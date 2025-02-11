import 'package:flutter/material.dart';
import 'makine.dart';

class Hesap extends StatelessWidget {
  const Hesap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesap Makinesi"),
      ),
      body: const Makine(),
    );
  }
}
