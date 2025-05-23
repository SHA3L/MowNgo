import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MowNgoApp());
}

class MowNgoApp extends StatelessWidget {
  const MowNgoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MowNgo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
    );
  }
}
