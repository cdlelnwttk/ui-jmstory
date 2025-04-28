import 'package:flutter/material.dart';

class AlbumListWidget extends StatelessWidget {
  final List<String> albumImages;
  final List<String> albumTitles;
  final List<String> albumReviews;

  // Constructor to accept parameters
  AlbumListWidget({
    required this.albumImages,
    required this.albumTitles,
    required this.albumReviews,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(albumImages.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      albumImages[index], // Use the correct image for each album
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          albumTitles[index], // Use the correct title for each album
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          albumReviews[index], // Use the correct review for each album
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
