import 'package:flutter/material.dart';
import 'review_widget.dart'; // Contains CustomRowWidget
import 'user_feed.dart'; // Contains FeedPage
import 'package:untitled3/data/user_info_data.dart'; // Your users list
import 'bottom_nav.dart';
import 'nav_logic.dart';
import 'drawer.dart';

class ExtendedReview extends StatefulWidget {
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
  final String imageCreator;

  const ExtendedReview({
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
    required this.imageCreator,
    Key? key,
  }) : super(key: key);

  @override
  State<ExtendedReview> createState() => _ExtendedReviewState();
}

class _ExtendedReviewState extends State<ExtendedReview> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
              child: Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Artist
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
              child: Text(
                "by ${widget.artist}",
                style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),

            // Image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SizedBox(
                  height: 250,
                  child: Image.asset(
                    widget.imagePath,
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
                  const Text("Release Type: Album", style: TextStyle(fontSize: 18)),
                  Text("Release Date: ${widget.year}", style: const TextStyle(fontSize: 18)),
                  Text("Genres: ${widget.genre}", style: const TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      const Text("Average Rating: ", style: TextStyle(fontSize: 18)),
                      ...List.generate(5, (index) {
                        return Icon(
                          index < widget.rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 18,
                        );
                      }),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            // Custom Row
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CustomRowWidget(
                imagePath: widget.imageCreator,
                textBoxContent: widget.reviewer,
                rating: widget.rating,
                bottomText: widget.description,
                imageHeight: 50,
                imageWidth: 50,
                review: 1,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          handleNavTap(context, index); // use shared nav logic
        },
      ),
    );
  }
}
