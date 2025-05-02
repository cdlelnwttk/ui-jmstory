import 'package:flutter/material.dart';
import 'review_screen.dart';

class ReviewDisplayPage extends StatelessWidget {
  final Map<String, dynamic> review;

  const ReviewDisplayPage({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text(review['title'] ?? 'Review')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: ReviewDisplay(
          review: review,
          controller: controller,
        ),
      ),
    );
  }
}
