import 'package:flutter/material.dart';
import 'hesap.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hesap Makinesi",
      home: const Hesap(),
    );
  }
}
