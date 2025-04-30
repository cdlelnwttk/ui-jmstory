import 'package:flutter/material.dart';
import 'review_widget.dart'; // Contains CustomRowWidget
import 'user_feed.dart'; // Contains FeedPage
import 'package:untitled3/data/user_info_data.dart'; // Your users list
import 'package:untitled3/data/release_card_data.dart';
import 'feed.dart';

class ListPage extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;
  final double size;
  final String reviewedBy;
  final String listBy;
  final String reviewer;
  final String creator;
  final int rating;
  final String year;
  final int number;
  final String genre;
  final String artist;
  final int number_of_reviews;

  const ListPage({
    required this.imagePath,
    required this.name,
    required this.description,
    required this.size,
    required this.reviewedBy,
    required this.listBy,
    required this.reviewer,
    required this.creator,
    required this.rating,
    required this.year,
    required this.number,
    required this.genre,
    required this.artist,
    required this.number_of_reviews,
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
            if (creator != null)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                child: Text(
                  "curated by $creator",
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
                  height: 300,
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
              child: Text(
                "$description",
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 500, // or whatever fits your design
              child: FeedList(items: reviews, a: 0, b: 0, c: 1, d: 1, f: 1, j:1),
            ),
            // Feed Section
          ],
        ),
      ),
    );
  }
}