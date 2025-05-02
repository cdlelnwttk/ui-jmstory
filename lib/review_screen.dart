import 'package:flutter/material.dart';
import 'album_widget.dart';
import 'star_rating.dart';
import 'release_widget.dart';
import 'bottom_nav.dart';
import 'nav_logic.dart';
class ReviewDisplay extends StatelessWidget {
  final Map<String, dynamic> review;
  final TextEditingController controller;

  const ReviewDisplay({
    super.key,
    required this.review,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Adds padding around the entire content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DetailPageWidget(
              imagePath: review['image'],
              name: review['title'],
              description: review['description'],
              size: 150,
              reviewedBy: review['reviewedBy'],
              listBy: review['createdBy'],
              reviewer: review['reviewer'],
              creator: review['creator'],
              rating: review['rating'],
              year: review['year'],
              number: review['number'],
              genre: review['genre'],
              artist: review['artist'],
              number_of_reviews: review['number_of_reviews'],
              imageCreator: review['imageCreator'],
            ),
            Row(
              children: [
                SizedBox(width: 18),
                Text(
                  'Personal Rating:   ',
                  style: TextStyle(fontSize: 20),
                ),
                StarRating(),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller,
              maxLines: 10,
              decoration: const InputDecoration(
                labelText: 'Write your review...',
                border: OutlineInputBorder(),
              ),
            ),
          ],

        ),

      ),

    );
  }
}
