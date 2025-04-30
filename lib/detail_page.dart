import 'package:flutter/material.dart';
import 'review_widget.dart'; // Contains CustomRowWidget
import 'user_feed.dart'; // Contains FeedPage
import 'package:untitled3/data/user_info_data.dart'; // Your users list

class DetailPage extends StatelessWidget {
  final String imagePath;
  final String name;
  final String? description;
  final double size;
  final String? reviewedBy;
  final String? listBy;
  final String? reviewer;
  final String? creator;
  final int? rating;
  final String? year;
  final int? number;
  final String? genre;
  final String? artist;
  final int? number_of_reviews;

  const DetailPage({
    required this.imagePath,
    required this.name,
    this.description,
    required this.size,
    this.reviewedBy,
    this.listBy,
    this.reviewer,
    this.creator,
    this.rating,
    this.year,
    this.number,
    this.genre,
    this.artist,
    this.number_of_reviews,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Artist
            if (artist != null)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                child: Text(
                  "by $artist",
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),

            // Image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SizedBox(
                  height: 350,
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // Info Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Release Type: Album", style: TextStyle(fontSize: 20)),
                  if (year != null)
                    Text("Release Date: $year", style: TextStyle(fontSize: 20)),
                  if (genre != null)
                    Text("Genres: $genre", style: TextStyle(fontSize: 20)),
                  if (rating != null)
                    Row(
                      children: [
                        Text("Rating: ", style: TextStyle(fontSize: 20)),
                        ...List.generate(5, (index) {
                          return Icon(
                            index < rating! ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: 30,
                          );
                        }),
                      ],
                    ),
                  SizedBox(height: 10),
                  if (number_of_reviews != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text("$number_of_reviews Reviews", style: TextStyle(fontSize: 20)),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 400, // or whatever fits your design
              child: FeedPage(users: users),
            ),
            // Feed Section
          ],
        ),
      ),
    );
  }
}

