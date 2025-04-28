import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

// Define the AlbumItem widget to display the image, title, and description
class AlbumItem extends StatelessWidget {
  final String imagePath;
  final String albumTitle;
  final String albumDescription;

  const AlbumItem({
    required this.imagePath,
    required this.albumTitle,
    required this.albumDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Ensures title is at the same height as the image
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
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
                albumTitle,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                albumDescription,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AlbumsPage extends StatelessWidget {
  // Example data (replace with your actual album data)
  final List<Map<String, String>> albums = [
    {
      'imagePath': 'assets/album1.jpg',
      'title': 'Album Title 1',
      'description': 'This is a short review you wrote about the album.',
    },
    {
      'imagePath': 'assets/album2.jpg',
      'title': 'Album Title 2',
      'description': 'This is a short review you wrote about the second album.',
    },
    {
      'imagePath': 'assets/album3.jpg',
      'title': 'Album Title 3',
      'description': 'This is a short review you wrote about the third album.',
    },
    // Add more albums here
  ];

  // Method to navigate to album details (if needed)
  void _navigateToAlbumDetail(String imagePath) {
    // Navigate to the album detail page (implement your navigation logic here)
    print('Navigating to album detail for: $imagePath');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Albums')),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(albums.length, (index) {
            final album = albums[index];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () => _navigateToAlbumDetail(album['imagePath']!),
                child: AlbumItem(
                  imagePath: album['imagePath']!,
                  albumTitle: album['title']!,
                  albumDescription: album['description']!,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
