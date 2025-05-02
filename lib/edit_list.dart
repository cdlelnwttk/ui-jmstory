import 'package:flutter/material.dart';
import 'list_tab_widget.dart'; // make sure this points to your ListTabWidget file
import 'bottom_nav.dart';
import 'nav_logic.dart';

class ListTabPage extends StatefulWidget {
  final List<Map<String, dynamic>> reviews;
  final String listName;
  final String description;
  final String imagePath;
  final List<Map<String, dynamic>> initialFeed;

  const ListTabPage({
    Key? key,
    required this.reviews,
    required this.listName,
    required this.description,
    required this.imagePath,
    required this.initialFeed,
  }) : super(key: key);

  @override
  _ListTabPageState createState() => _ListTabPageState();
}

class _ListTabPageState extends State<ListTabPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTabWidget(
        reviews: widget.reviews,
        listName: widget.listName,
        description: widget.description,
        imagePath: widget.imagePath,
        initialFeed: widget.initialFeed,
      ),
    );
  }
}
