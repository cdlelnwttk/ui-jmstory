import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  final String imagePath;
  final String textBoxContent;
  final int rating;
  final String bottomText;
  final double imageHeight;
  final double imageWidth;

  const CustomRowWidget({
    required this.imagePath,
    required this.textBoxContent,
    required this.rating,
    required this.bottomText,
    required this.imageHeight,
    required this.imageWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row containing image, textbox content (centered vertically), and rating (aligned to top-right)
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

            // Expanded middle and right content
            Expanded(
              child: SizedBox(
                height: imageHeight,
                child: Stack(
                  children: [
                    // Text in middle vertically
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

                    // Rating aligned to top-right
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
        // Bottom text aligned with start of image
           Text(
            bottomText,
            style: TextStyle(fontSize: 16),
          ),
        SizedBox(height: 15.0),
      ],
    );
  }
}
