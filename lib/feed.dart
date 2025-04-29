import 'package:flutter/material.dart';
import 'album_widget.dart';

class FeedList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final int a;
  final int b;
  final int c;
  final int d;
  final int f;

  const FeedList({
    Key? key,
    required this.items,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.f,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        // Check if rating exists and pass it, or pass null if it doesn't
        final rating = item['rating'] != null ? item['rating'] as int : null;
        final reviewedBy = item['reviewedBy'] != null ? item['reviewedBy'] as String : null;
        final listBy = item['listBy'] != null ? item['listBy'] as String : null;
        final reviewer = item['reviewer'] != null ? item['reviewer'] as String : null;
        final creator = item['creator'] != null ? item['creator'] as String : null;
        final year = item['year'] != null ? item['year'] as String : null;
        final number = item['number'] != null ? item['number'] as int : null;
        final genre = item['genre'] != null ? item['genre'] as String : null;
        final artist = item['artist'] != null ? item['artist'] as String : null;
        final reviews = item['number_of_reviews'] != null ? item['number_of_reviews'] as int : null;
        final size = item['size'] != null ? item['size'] as double : 150.0;
        return CustomInfoCard(
          imagePath: item['image'] ?? '',
          name: item['title'] ?? '',
          description: item['description'] ?? '',
          reviewedBy: reviewedBy,
          listBy: listBy,
          reviewer: reviewer,
          creator: creator,
          rating: rating,
          size: size,
          year: year,
          number: number,
          genre: genre,
          artist: artist,
          number_of_reviews: reviews,
          review : a,
          activity: b,
          list: c,
          detail: d,
          charts: f,
        );
      },
    );
  }
}