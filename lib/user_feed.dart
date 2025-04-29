import 'review_widget.dart';  // Assuming CustomRowWidget is inside this file
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  final List<Map<String, dynamic>> users;

  // Constructor to accept the list of users
  const FeedPage({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: users.map<Widget>((user) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomRowWidget(
              imagePath: user['imagePath'] ?? '', // Adjust image path as needed
              textBoxContent: user['textBoxContent'] ?? 'username',
              rating: user['rating'] ?? 0, // Adjust rating as needed
              bottomText: user['bottomText'] ?? 'Start of the review',
              imageHeight: 50,
              imageWidth: 50,
            ),
          ),
        );
      }).toList(),
    );
  }
}


