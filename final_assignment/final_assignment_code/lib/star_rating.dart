// star_rating.dart
import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _filledStars = 0;

  void _onStarTapped(int index) {
    setState(() {
      _filledStars = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => _onStarTapped(index),
          child: Icon(
            Icons.star,
            color: index < _filledStars ? Colors.amber : Colors.grey,
            size: 25,
          ),
        );
      }),
    );
  }
}
