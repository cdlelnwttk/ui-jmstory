import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'list_page.dart';
import 'extended_review.dart';

class CustomInfoCard extends StatelessWidget {
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
  final int review;
  final int list;
  final int activity;
  final int detail;
  final int charts;
  final int outside;
  final String imageCreator;

  const CustomInfoCard({
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
    required this.review,
    required this.activity,
    required this.detail,
    required this.list,
    required this.charts,
    required this.outside,
    required this.imageCreator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (activity == 1 && review == 1)
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
          if (activity == 1 && list == 1)
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image on the left
              GestureDetector(
                onTap: () {
                  if (list == 1 && outside == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ListPage(
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
                          // pass the required arguments here
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
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
                        ),
                      ),
                    );
                  }
                },
                child: Image.asset(
                  imagePath,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15),
              // Main content in center
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(

                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    if (detail == 1)
                      Text(
                        '$artist',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    if (detail == 1)
                      Text(
                        '$year',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    if (detail == 1)
                      Text(
                        '$genre',
                         style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                      ),
                    if (list == 1 && outside == 0)
                      Text(
                        'creator: $creator',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    if (review == 1)
                      Text(
                        'Reviewer: $reviewer',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    if (list == 0)
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
                    if (detail == 1 && list == 0)
                      Text(
                        '$number_of_reviews reviews',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    if (detail == 0)
                      GestureDetector(
                        onTap: () {
                          if (review == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ExtendedReview(
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
                          }
                        },
                        child: Text(
                          '$description',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                  ],
                ),
              ),
              // Number on the right
              if (charts == 1)
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



