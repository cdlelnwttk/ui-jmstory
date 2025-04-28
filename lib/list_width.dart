import 'package:flutter/material.dart';

class CustomInfoCardList extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;
  final double size;
  final String? listBy; // Optional "list by" text
  final String? listCreator; // Optional list creator name

  const CustomInfoCardList({
    required this.imagePath,
    required this.name,
    required this.description,
    required this.size,
    this.listBy,
    this.listCreator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "List By" or custom text at the top
          if (listBy != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                '$listBy list...',
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
                    // List creator field (if provided)
                    if (listCreator != null)
                      Text(
                        'List creator: $listCreator',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
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
