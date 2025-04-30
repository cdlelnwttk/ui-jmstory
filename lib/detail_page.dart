import 'package:flutter/material.dart';
import 'review_widget.dart'; // Contains CustomRowWidget
import 'user_feed.dart'; // Contains FeedPage
import 'package:untitled3/data/user_info_data.dart'; // Your users list
import 'bottom_nav.dart';
import 'nav_logic.dart';
import 'drawer.dart';

class DetailPage extends StatefulWidget {
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
            // Name
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Artist
            if (widget.artist != null)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                child: Text(
                  "by ${widget.artist}",
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
                  Text("Release Type: Album", style: TextStyle(fontSize: 18)),
                  if (widget.year != null)
                    Text("Release Date: ${widget.year}", style: TextStyle(fontSize: 18)),
                  if (widget.genre != null)
                    Text("Genres: ${widget.genre}", style: TextStyle(fontSize: 18)),
                  if (widget.rating != null)
                    Row(
                      children: [
                        Text("Average Rating: ", style: TextStyle(fontSize: 18)),
                        ...List.generate(5, (index) {
                          return Icon(
                            index < widget.rating! ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: 18,
                          );
                        }),
                      ],
                    ),
                  SizedBox(height: 10),
                  if (widget.number_of_reviews != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text("${widget.number_of_reviews} Reviews", style: TextStyle(fontSize: 20)),
                    ),
                ],
              ),
            ),

            // Feed Section
            SizedBox(
              height: 400,
              child: FeedPage(users: users, a:1),
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

