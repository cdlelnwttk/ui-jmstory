import 'package:flutter/material.dart';

class CustomInfoCard extends StatelessWidget {
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

  const CustomInfoCard({
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (listBy != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                '$listBy created...',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ),
          if (reviewedBy != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                '$reviewedBy reviewed...',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image on the left
              Image.asset(
                imagePath,
                width: size,
                height: size,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 15),
              // Main content in center
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    if (artist != null)
                      Text(
                        '$artist',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    if (year != null)
                      Text(
                        '$year',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    if (genre != null)
                      Text(
                        '$genre',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    if (creator != null)
                      Text(
                        'creator: $creator',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    if (reviewer != null)
                      Text(
                        'Reviewer: $reviewer',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    if (rating != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < rating!
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 18,
                            );
                          }),
                        ),
                      ),
                    if (number_of_reviews
                        != null)
                      Text(
                        '$number_of_reviews reviews',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    SizedBox(height: 8),
                    if (description != null)
                      Text(
                        '$description',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
              ),
              // Number on the right
              if (number != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '$number',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}



