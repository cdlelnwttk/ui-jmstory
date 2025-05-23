import 'review_widget.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  final List<Map<String, dynamic>> users;
  final int a;

  const FeedPage({Key? key, required this.users, required this.a}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final item = users[index];
        return CustomRowWidget(
          imagePath: item['imagePath'] ?? '',
          textBoxContent: item['textBoxContent'],
          rating: item['rating'],
          bottomText: item['bottomText'],
          imageHeight: item['imageHeight'],
          imageWidth: item['imageWidth'],
          review: a,
        );
      },
    );
  }
}

