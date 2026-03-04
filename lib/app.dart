import 'package:flutter/material.dart';
import 'package:quote_generator/screens/quote_screen.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Random Qasou9e8',
      debugShowCheckedModeBanner: false,
      home: QuoteScreen(),
    );
  }
}
