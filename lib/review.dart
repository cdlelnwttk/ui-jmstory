import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For loading assets

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search and Detail Example',
      home: SearchWidgetPage(),
    );
  }
}

class SearchWidgetPage extends StatefulWidget {
  @override
  _SearchWidgetPageState createState() => _SearchWidgetPageState();
}

class _SearchWidgetPageState extends State<SearchWidgetPage> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  List<Map<String, dynamic>> _reviews = [];
  List<Map<String, dynamic>> _filteredData = [];
  Map<String, dynamic>? _selectedReview;

  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  // Load reviews from the JSON file
  Future<void> _loadReviews() async {
    String jsonString = await _loadAsset('assets/data.json');
    Map<String, dynamic> jsonResponse = json.decode(jsonString);
    setState(() {
      _reviews = List<Map<String, dynamic>>.from(jsonResponse['reviews']);
      _filteredData = List.from(_reviews);
    });
  }

  // Helper function to load the asset file as a string
  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  // Filter the reviews data based on the search query
  void _searchData(String query) {
    setState(() {
      _filteredData = _reviews
          .where((item) =>
          item['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // Display detailed information and the large text box after selecting a result
  void _selectReview(Map<String, dynamic> review) {
    setState(() {
      _selectedReview = review;
      _textController.clear(); // Clear the text box when a new review is selected
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Reviews')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              onChanged: _searchData,
              decoration: InputDecoration(
                labelText: 'Search Titles',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),

            // Display search results only if there are any
            if (_filteredData.isNotEmpty) ...[
              ListView.builder(
                shrinkWrap: true,
                itemCount: _filteredData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredData[index]['title']!),
                    onTap: () {
                      _selectReview(_filteredData[index]); // Select the review
                    },
                  );
                },
              ),
            ] else if (_searchController.text.isNotEmpty) ...[
              Text('No results found'),
            ],
            SizedBox(height: 20),

            // Display detailed information when a review is selected
            if (_selectedReview != null) ...[
              // Display review title
              Text(
                _selectedReview!['title']!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Display review description
              Text(
                'Description: ${_selectedReview!['description']!}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),

              // Display review details
              Text(
                'Artist: ${_selectedReview!['artist']!}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Genre: ${_selectedReview!['genre']!}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Year: ${_selectedReview!['year']!}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              TextField(
                controller: _textController,
                maxLines: 6,
                decoration: InputDecoration(
                  labelText: 'Write your comment...',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}




