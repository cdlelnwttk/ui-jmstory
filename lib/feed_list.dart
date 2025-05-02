// feed_list.dart
import 'package:flutter/material.dart';
import 'album_widget.dart'; // Import the widget for displaying each item

class FeedList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final int a;
  final int b;
  final int c;
  final int d;
  final int f;
  final int j;
  final int remove;
  final bool fromProfile;
  const FeedList({
    Key? key,
    required this.items,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.f,
    required this.j,
    required this.remove,
    required this.fromProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        // Check if rating exists and pass it, or pass null if it doesn't
        final size = item['size'] != null ? item['size'] as double : 150.0;
        return CustomInfoCard(
          imagePath: item['image']  ?? '',
          name: item['title'] ?? '',
          description: item['description'] ?? '',
          reviewedBy: item['reviewedBy'] ?? '',
          listBy: item['listBy'] ?? '',
          reviewer: item['reviewer'] ?? '',
          creator: item['creator'] ?? '',
          rating: item['rating'] ?? '',
          size: size,
          year: item['year'] ?? '',
          number: item['number'] ?? '',
          genre: item['genre'] ?? '',
          artist: item['artist'] ?? '',
          number_of_reviews: item['number_of_reviews'] ?? '',
          review : a,
          activity: b,
          list: c,
          detail: d,
          charts: f,
          outside: j,
          imageCreator: item['imageCreator'] ?? '',
          remove : remove,
          isListPage: fromProfile,
        );
      },
    );
  }
}
