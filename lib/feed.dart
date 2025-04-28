import 'package:flutter/material.dart';
import 'album_widget.dart';

class FeedList extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const FeedList({Key? key, required this.items}) : super(key: key);

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
        return CustomInfoCard(
          imagePath: item['image'] ?? '',
          name: item['title'] ?? '',
          description: item['description'] ?? '',
          size: 150, // You can adjust the size here
          reviewedBy: reviewedBy,
          listBy: listBy,
          reviewer: reviewer,
          creator: creator,
          rating: rating,

        );
      },
    );
  }
}