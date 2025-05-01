import 'package:flutter/material.dart';
import 'dart:io';
import 'album_widget.dart';
class ListTabWidget extends StatefulWidget {
  final List<Map<String, dynamic>> reviews;

  const ListTabWidget({Key? key, required this.reviews}) : super(key: key);

  @override
  _ListTabWidgetState createState() => _ListTabWidgetState();
}

class _ListTabWidgetState extends State<ListTabWidget> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredData = [];
  bool _showSuggestions = false;
  Map<String, dynamic>? _selectedItem;
  List<Map<String, dynamic>> _feed = []; // To store the selected items

  @override
  void initState() {
    super.initState();
    _filteredData = List.from(widget.reviews);
  }

  void _search(String query) {
    setState(() {
      _filteredData = widget.reviews
          .where((item) => item['title']!
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
      _showSuggestions = query.isNotEmpty && _filteredData.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _addToFeed(Map<String, dynamic> item) {
    // Add the selected item to the feed list
    setState(() {
      _feed.add(item); // This adds the item to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              onChanged: _search,
              decoration: InputDecoration(
                labelText: 'Search Titles',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16),

            // Search result suggestions (only visible when valid search is performed)
            if (_showSuggestions && _filteredData.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _filteredData.length,
                itemBuilder: (context, index) {
                  var item = _filteredData[index];
                  return ListTile(
                    title: Text(item['title']),
                    onTap: () {
                      setState(() {
                        _selectedItem = item;
                        _searchController.text = item['title'];
                        _showSuggestions = false;
                      });
                    },
                  );
                },
              ),

            // Display card only if a valid item was selected
            if (_selectedItem != null)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    CustomInfoCard(
                      imagePath: _selectedItem!['image'],
                      name: _selectedItem!['title'],
                      description: _selectedItem!['description'],
                      size: 150,
                      reviewedBy: _selectedItem!['reviewedBy'],
                      listBy: _selectedItem!['createdBy'],
                      reviewer: _selectedItem!['reviewer'],
                      creator: _selectedItem!['creator'],
                      rating: _selectedItem!['rating'],
                      year: _selectedItem!['year'],
                      number: _selectedItem!['number'],
                      genre: _selectedItem!['genre'],
                      artist: _selectedItem!['artist'],
                      number_of_reviews: _selectedItem!['number_of_reviews'],
                      review: 0,
                      activity: 0,
                      detail: 0,
                      list: 1,
                      charts: 0,
                      outside: 0,
                      imageCreator: _selectedItem!['imageCreator'],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_selectedItem != null) {
                          _addToFeed(_selectedItem!); // Add the selected item directly to feed
                        }
                      },
                      child: Text("Add to Feed"),
                    ),
                  ],
                ),
              ),

            // Display the feed of selected items
            if (_feed.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Feed:'),
                    for (var item in _feed)
                      ListTile(
                        title: Text(item['title']),
                        subtitle: Text(item['description']),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

