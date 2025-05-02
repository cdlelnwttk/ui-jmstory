import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  final String imagePath;
  final String textBoxContent;
  final int rating;
  final String bottomText;
  final double imageHeight;
  final double imageWidth;
  final int review;

  const CustomRowWidget({
    required this.imagePath,
    required this.textBoxContent,
    required this.rating,
    required this.bottomText,
    required this.imageHeight,
    required this.imageWidth,
    required this.review,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                height: imageHeight,
                width: imageWidth,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Expanded(
              child: SizedBox(
                height: imageHeight,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 80.0),
                        child: Text(
                          textBoxContent,
                          style: TextStyle(fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

                    if (review == 1)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(5, (index) {
                            return Icon(
                              index < rating ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                              size: 20,
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
          SizedBox(height: 15.0),
        if (review == 1)
           Text(
            bottomText,
            style: TextStyle(fontSize: 16),
          ),
        if (review == 1)
        SizedBox(height: 15.0),
      ],
    );
  }
}
