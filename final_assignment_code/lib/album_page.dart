import 'package:flutter/material.dart';
import 'album_data.dart'; // where your albums list is

class AlbumDetailPage extends StatelessWidget {
  final String imagePath;

  const AlbumDetailPage({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Find the album based on the image path
    final album = albums.firstWhere((album) => album.imagePath == imagePath);

    return Scaffold(
      appBar: AppBar(title: Text(album.albumTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  album.imagePath,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    album.albumTitle,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Artist: ${album.artist}'),
            Text('Release Date: ${album.releaseDate}'),
            Row(
              children: [
                Text('Rating: ${album.rating} ⭐'),
              ],
            ),
            Text('Genres: ${album.genres.join(', ')}'),
          ],
        ),
      ),
    );
  }
}

