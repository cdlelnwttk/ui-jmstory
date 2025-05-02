import 'package:flutter/material.dart';
import 'review_widget.dart';
import 'user_feed.dart';
import 'package:untitled3/data/user_info_data.dart';
import 'bottom_nav.dart';
import 'nav_logic.dart';
import 'drawer.dart';
import 'detail_page.dart';
import 'release_widget.dart';
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
            DetailPageWidget(
              imagePath: widget.imagePath,
              name: widget.name,
              description: widget.description,
              size: widget.size,
              reviewedBy: widget.reviewedBy,
              listBy: widget.listBy,
              reviewer: widget.reviewer,
              creator: widget.creator,
              rating: widget.rating,
              year: widget.year,
              number: widget.number,
              genre: widget.genre,
              artist: widget.artist,
              number_of_reviews: widget.number_of_reviews,
              imageCreator: widget.imageCreator,
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
          handleNavTap(context, index);
        },
      ),
    );
  }
}