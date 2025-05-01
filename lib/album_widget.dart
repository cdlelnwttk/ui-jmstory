import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'list_page.dart';
import 'extended_review.dart';

class CustomInfoCard extends StatefulWidget {
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
  final int remove; // NEW: determines whether to show the remove button

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
    required this.remove, // Default value is 0 (do not show remove button)
    Key? key,
  }) : super(key: key);

  @override
  _CustomInfoCardState createState() => _CustomInfoCardState();
}

class _CustomInfoCardState extends State<CustomInfoCard> {
  bool _isVisible = true; // Control visibility of the card

  void _handleRemove() {
    setState(() {
      _isVisible = false; // Hide the card when the remove button is pressed
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) {
      return SizedBox.shrink();  // Return an empty widget if not visible
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.activity == 1 && widget.review == 1)
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                '${widget.reviewedBy} reviewed...',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ),
          if (widget.activity == 1 && widget.list == 1)
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                '${widget.listBy} created...',
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
                  if (widget.list == 1 && widget.outside == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ListPage(
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
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
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
                        ),
                      ),
                    );
                  }
                },
                child: Image.asset(
                  widget.imagePath,
                  width: widget.size,
                  height: widget.size,
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
                        widget.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    if (widget.detail == 1)
                      Text(
                        '${widget.artist}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    if (widget.detail == 1)
                      Text(
                        '${widget.year}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    if (widget.detail == 1)
                      Text(
                        '${widget.genre}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    if (widget.list == 1 && widget.outside == 0)
                      Text(
                        'creator: ${widget.creator}',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    if (widget.review == 1)
                      Text(
                        'Reviewer: ${widget.reviewer}',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    if (widget.list == 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < widget.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 18,
                            );
                          }),
                        ),
                      ),
                    if (widget.detail == 1 && widget.list == 0)
                      Text(
                        '${widget.number_of_reviews} reviews',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    if (widget.detail == 0)
                      GestureDetector(
                        onTap: () {
                          if (widget.review == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ExtendedReview(
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
                              ),
                            );
                          }
                        },
                        child: Text(
                          '${widget.description}',
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
              // Number or remove icon on the right
              if (widget.charts == 1)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '${widget.number}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (widget.remove == 1)
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: _handleRemove, // Hide card when pressed
                  tooltip: 'Remove',
                ),
            ],
          ),
        ],
      ),
    );
  }
}





