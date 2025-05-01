// feed_page.dart
import 'package:flutter/material.dart';
import 'feed_list.dart'; // Import the FeedList widget

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Map<String, dynamic>> _items = []; // Hold the list of items

  // Example values for a, b, c, d, f, j
  final int a = 1;
  final int b = 2;
  final int c = 3;
  final int d = 4;
  final int f = 5;
  final int j = 6;

  // This function adds a new item to the feed
  void _addToFeed(Map<String, dynamic> newItem) {
    setState(() {
      _items.add(newItem);  // Add the new item to the list
    });
  }

  // This is just an example to add a new item to the feed (in practice, this can be triggered by a button or user input)
  void _simulateAddingItem() {
    final newItem = {
      'image': 'path/to/image.png',
      'title': 'New Item',
      'description': 'This is a new item.',
      'reviewedBy': 'John Doe',
      'listBy': 'Jane Doe',
      'reviewer': 'Alice',
      'creator': 'Bob',
      'rating': '5',
      'size': 200.0,
      'year': '2025',
      'number': '100',
      'genre': 'Pop',
      'artist': 'Artist Name',
      'number_of_reviews': '50',
      'imageCreator': 'Image Creator',
    };
    _addToFeed(newItem);  // Add item to feed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feed Page")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _simulateAddingItem,  // Simulate adding an item
            child: Text("Add Item to Feed"),
          ),
          Expanded(
            child: FeedList(
              items: _items,
              a: a,
              b: b,
              c: c,
              d: d,
              f: f,
              j: j,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: FeedPage()));
}
