import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Album Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlbumDetailPage(),
    );
  }
}

class AlbumDetailPage extends StatelessWidget {
  // Sample data for the album details and reviews
  final album = {
    'cover': 'assets/images/album_one.jpg',
    'title': 'Album One',
    'year': '2025',
    'artist': 'Artist Name',
    'genre': 'Pop',
    'rating': '4.5',
  };

  final reviews = [
    {
      'reviewer': 'John Doe',
      'review': 'This album is amazing! Loved every track.',
      'icon': Icons.person,
    },
    {
      'reviewer': 'Jane Smith',
      'review': 'A great mix of different styles, truly unique.',
      'icon': Icons.person_outline,
    },
    {
      'reviewer': 'Bob Brown',
      'review': 'The album grows on you. At first, I wasn\'t sure, but it\'s catchy.',
      'icon': Icons.person,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album['title'] as String),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Album cover header
            Image.asset(
              album['cover'] as String,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Album details
                  Text(
                    'Year: ${album['year'] as String}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Artist: ${album['artist'] as String}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Genre: ${album['genre'] as String}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rating: ${album['rating'] as String}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(),
                  SizedBox(height: 16),
                  // Reviews section
                  Text(
                    'Reviews',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  // Review list
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: reviews.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      final review = reviews[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Icon(review['icon'] as IconData),
                        ),
                        title: Text(
                          review['reviewer'] as String, // Explicit cast to String
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(review['review'] as String), // Explicit cast to String
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
