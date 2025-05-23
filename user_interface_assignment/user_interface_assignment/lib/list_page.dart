import 'package:flutter/material.dart';
import 'review_widget.dart';
import 'user_feed.dart';
import 'package:untitled3/data/user_info_data.dart';
import 'package:untitled3/data/release_card_data.dart';
import 'feed.dart';
import 'bottom_nav.dart';
import 'nav_logic.dart';
import 'drawer.dart';
import 'feed_list.dart';
import 'list_tab_widget.dart';
import 'edit_list.dart';

class ListPage extends StatefulWidget {
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
  final bool fromProfilePage;

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
    required this.fromProfilePage,
    Key? key,
  }) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0),
              child: Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
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
            if (widget.creator.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                child: Text(
                  "curated by ${widget.creator}",
                  style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
              child: Column(
                children: [
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  if (widget.fromProfilePage)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListTabPage(
                              reviews: [
                                {
                                  'imagePath': widget.imagePath,
                                  'name': widget.name,
                                  'description': widget.description,
                                  'size': widget.size,
                                  'reviewedBy': widget.reviewedBy,
                                  'listBy': widget.listBy,
                                  'reviewer': widget.reviewer,
                                  'creator': widget.creator,
                                  'rating': widget.rating,
                                  'year': widget.year,
                                  'number': widget.number,
                                  'genre': widget.genre,
                                  'artist': widget.artist,
                                  'number_of_reviews': widget.number_of_reviews,
                                }
                              ],
                              listName: widget.name,
                              description: widget.description,
                              imagePath: widget.imagePath,
                              initialFeed: reviews,
                            ),
                          ),
                        );
                      },
                      child: const Text('Edit List'),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: FeedList(items: reviews, a: 0, b: 0, c: 0, d: 1, f: 1, j: 1, remove: 0,fromProfile: false),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) => handleNavTap(context, index),
      ),
    );
  }
}