import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/album_widget.dart';
import 'star_rating.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'list_tab_widget.dart';
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
  bool _showSuggestions = false;

  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  Future<void> _loadReviews() async {
    String jsonString = await _loadAsset('assets/data.json');
    Map<String, dynamic> jsonResponse = json.decode(jsonString);
    setState(() {
      _reviews = List<Map<String, dynamic>>.from(jsonResponse['reviews']);
      _filteredData = List.from(_reviews);
    });
  }

  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  void _searchData(String query) {
    setState(() {
      _showSuggestions = query.isNotEmpty;
      _filteredData = _reviews
          .where((item) =>
          item['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _selectReview(Map<String, dynamic> review) {
    setState(() {
      _selectedReview = review;
      _textController.clear();
      _showSuggestions = false;
    });
  }

  void _onSearchSubmit(String query) {
    if (query.isNotEmpty && _filteredData.isNotEmpty) {
      _selectReview(_filteredData[0]);
    }
    setState(() {
      _showSuggestions = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Review'),
              Tab(text: 'List'),
            ],
          ),
          title: const Text('Edit Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                // Save action (for now just print)
                print('Profile saved');
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            // --- Review Tab ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _searchController,
                    onChanged: _searchData,
                    onSubmitted: _onSearchSubmit,
                    decoration: InputDecoration(
                      labelText: 'Search Titles',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(height: 20),
                  if (_showSuggestions && _filteredData.isNotEmpty) ...[
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filteredData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_filteredData[index]['title']!),
                          onTap: () {
                            _selectReview(_filteredData[index]);
                          },
                        );
                      },
                    ),
                  ],
                  SizedBox(height: 20),
                  if (_selectedReview != null) ...[
                    CustomInfoCard(
                      imagePath: _selectedReview!['image']!,
                      name: _selectedReview!['title']!,
                      description: _selectedReview!['description']!,
                      size: 200,
                      reviewedBy: _selectedReview!['reviewedBy']!,
                      listBy: _selectedReview!['createdBy']!,
                      reviewer: _selectedReview!['reviewer']!,
                      creator: _selectedReview!['creator']!,
                      rating: _selectedReview!['rating']!,
                      year: _selectedReview!['year']!,
                      number: _selectedReview!['number']!,
                      genre: _selectedReview!['genre']!,
                      artist: _selectedReview!['artist']!,
                      number_of_reviews: _selectedReview!['number_of_reviews']!,
                      review: 0,
                      activity: 0,
                      detail: 1,
                      list: 0,
                      charts: 0,
                      outside: 0,
                      imageCreator: _selectedReview!['imageCreator']!,
                      remove: 0,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Rating:   ',
                          style: TextStyle(fontSize: 20),
                        ),
                        StarRating(),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _textController,
                      maxLines: 10,
                      decoration: InputDecoration(
                        labelText: 'Write your review...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // --- List Tab ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTabWidget(reviews: _reviews),
            ),
          ],
        ),
      ),
    );
  }
}




