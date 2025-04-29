import 'package:flutter/material.dart';

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 60.0,
            backgroundColor: Theme
                .of(context)
                .primaryColor,
            title: Text(name),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0), // white space around image
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // optional
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Release Title: $name",
                    style: TextStyle(fontSize: 20), // Change 18 to whatever size you prefer
                  ),
                    Text(
                      "Artist: $artist",
                      style: TextStyle(fontSize: 20), // Change 18 to whatever size you prefer
                    ),
                  Text(
                    "Release Date: $year",
                    style: TextStyle(fontSize: 20), // Change 18 to whatever size you prefer
                  ),
                  Text(
                    "Genres: $genre",
                    style: TextStyle(fontSize: 20), // Change 18 to whatever size you prefer
                  ),
                  if (rating != null)
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < rating! ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 30,
                        );
                      }),
                    ),
                  if (number_of_reviews != null)
                    Text("$number_of_reviews Reviews"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
