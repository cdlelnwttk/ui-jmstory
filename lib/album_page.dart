import 'package:flutter/material.dart';

class AlbumDetailPage extends StatelessWidget {
  final String imagePath;
  final String albumTitle;
  final String artist;
  final String releaseDate;
  final double rating; // Assume out of 5.0
  final List<String> genres;

  const AlbumDetailPage({
    required this.imagePath,
    required this.albumTitle,
    required this.artist,
    required this.releaseDate,
    required this.rating,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Album Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    albumTitle,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],

            ),
            SizedBox(height: 24),
            Text(
              'Artist: $artist',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Release Date: $releaseDate',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Rating: ',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: List.generate(5, (index) {
                    if (index < rating.round()) {
                      return Icon(Icons.star, color: Colors.amber, size: 20);
                    } else {
                      return Icon(Icons.star_border, color: Colors.grey, size: 20);
                    }
                  }),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Genres: ${genres.join(", ")}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
