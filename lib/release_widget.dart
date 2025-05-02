import 'package:flutter/material.dart';
import 'detail_page.dart';

class DetailPageWidget extends StatelessWidget {
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

  const DetailPageWidget({
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Title in bold and centered above the image
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  imagePath: imagePath,
                  name: name,
                  description: description,
                  size: size,
                  reviewedBy: reviewedBy,
                  listBy: listBy,
                  reviewer: reviewer,
                  creator: creator,
                  rating: rating,
                  year: year,
                  number: number,
                  genre: genre,
                  artist: artist,
                  number_of_reviews: number_of_reviews,
                  imageCreator: imageCreator,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 2.0, left: 16.0, right: 16.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // Image Section
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  imagePath: imagePath,
                  name: name,
                  description: description,
                  size: size,
                  reviewedBy: reviewedBy,
                  listBy: listBy,
                  reviewer: reviewer,
                  creator: creator,
                  rating: rating,
                  year: year,
                  number: number,
                  genre: genre,
                  artist: artist,
                  number_of_reviews: number_of_reviews,
                  imageCreator: imageCreator,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                height: 250,
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
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
              // Name and other information
              SizedBox(height: 5),
              Text("Artist: $artist", style: TextStyle(fontSize: 18)),
              SizedBox(height: 5),
              Text("Release Type: Album", style: TextStyle(fontSize: 18)),
              SizedBox(height: 5),
              if (year.isNotEmpty)
                Text("Release Date: $year", style: TextStyle(fontSize: 18)),
              SizedBox(height: 5),
              if (genre.isNotEmpty)
                Text("Genres: $genre", style: TextStyle(fontSize: 18)),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Average Rating: ", style: TextStyle(fontSize: 18)),
                  ...List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 18,
                    );
                  }),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}