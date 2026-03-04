import 'package:flutter/material.dart';
import 'package:quote_generator/widgets/quote_widget.dart';
import 'package:quote_generator/data/quote_data.dart';
import 'package:quote_generator/models/quote.dart';
import 'package:quote_generator/constants/app_color.dart';
import 'dart:math';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final Random _random = Random();
  late Quote _currentQuote;
  late Color _currentColor;

  Quote _getRandomQuote() {
    return allQuotes[_random.nextInt(allQuotes.length)];
  }

  Color _getRandomColor() {
    return AppColors.gradients[_random.nextInt(AppColors.gradients.length)];
  }

  void _generateNewQuote() {
    setState(() {
      _currentQuote = _getRandomQuote();
      _currentColor = _getRandomColor();
    });
  }

  @override
  void initState() {
    super.initState();
    _currentQuote = _getRandomQuote();
    _currentColor = _getRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 80),

            // Header
            const Text(
              'Quote of the day',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.2,
              ),
            ),

            const Spacer(), // pushes card to center

            QuoteCard(
                quote: _currentQuote,
                acentColor: _currentColor), // our card widget

            const Spacer(), // pushes button to bottom

            // Button placeholder
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: InkWell(
                  onTap: _generateNewQuote,
                  child: const Text(
                    'New Quote',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
