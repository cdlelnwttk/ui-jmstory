import 'package:flutter/material.dart';
import 'package:untitled3/release_widget.dart';
import 'review_widget.dart';
import 'user_feed.dart';
import 'package:untitled3/data/user_info_data.dart';
import 'bottom_nav.dart';
import 'nav_logic.dart';
import 'drawer.dart';
import 'review_from_page.dart';
import 'review_widget.dart';

class DetailPage extends StatefulWidget {
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

  const DetailPage({
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
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Release'),
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
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(150, 50)),
                ),
                onPressed: () {
                  Map<String, dynamic> reviewData = {
                    'title': widget.name,
                    'image': widget.imagePath,
                    'description': widget.description,
                    'rating': widget.rating,
                    'year': widget.year,
                    'genre': widget.genre,
                    'artist': widget.artist,
                    'number_of_reviews': widget.number_of_reviews,
                    'reviewedBy': widget.reviewedBy,
                    'reviewer': widget.reviewer,
                    'createdBy': widget.listBy,
                    'creator': widget.creator,
                    'imageCreator': widget.imageCreator,
                    'number': widget.number,
                  };
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ReviewDisplayPage(review: reviewData),
                    ),
                  );
                },
                child: Text('Add Review'),
              ),
            ),
            if (widget.number_of_reviews != null) ...[
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "${widget.number_of_reviews} Reviews",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 10),
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Theme.of(context).primaryColor,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "Top Reviews"),
                        Tab(text: "Friends' Reviews"),
                      ],
                    ),
                    SizedBox(
                      height: 400,
                      child: TabBarView(
                        children: [
                          FeedPage(users: users, a: 1),
                          FeedPage(users: users, a: 1),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
