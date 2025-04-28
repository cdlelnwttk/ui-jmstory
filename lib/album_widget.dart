import 'package:flutter/material.dart';

class CustomInfoCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;
  final double size;
  final String? reviewedBy; // Optional "reviewed by" text
  final String? reviewer;  // Optional reviewer name

  const CustomInfoCard({
    required this.imagePath,
    required this.name,
    required this.description,
    required this.size,
    this.reviewedBy,   // Optional "reviewed by"
    this.reviewer,     // Optional reviewer
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "Reviewed By" or custom text at the top
          if (reviewedBy != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                '$reviewedBy reviewed...', // Display reviewed by
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[700],
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Review By field (only shown if reviewer is provided)
                    if (reviewer != null)
                      Text(
                        'Review By: $reviewer',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                    SizedBox(height: 8),
                    // Description
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

