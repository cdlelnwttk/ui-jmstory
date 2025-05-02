import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/album_widget.dart';
import 'star_rating.dart';
import 'dart:io';
import 'list_tab_widget.dart';
import 'bottom_nav.dart';
import 'nav_logic.dart';
import 'drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search and Detail Example',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Adjust primary theme color here
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue, // Adjust the app bar color
        ),
        scaffoldBackgroundColor: Colors.grey[200], // Background color of the body
      ),
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  List<Map<String, dynamic>> _reviews = [];
  List<Map<String, dynamic>> _filteredData = [];
  Map<String, dynamic>? _selectedReview;
  bool _showSuggestions = false;
  int _selectedIndex = 0;
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
      length: 3, // Updated the Tab length for 'Releases', 'List', 'Users'
      child: Scaffold(
        appBar: AppBar(),
        drawer: CustomDrawer(),
        body: Column(
          children: [
            // --- Search Bar ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                onChanged: _searchData,
                onSubmitted: _onSearchSubmit,
                decoration: InputDecoration(
                  labelText: 'Search Titles',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            // --- Suggestions Overlaying the TabBar ---
            if (_showSuggestions && _filteredData.isNotEmpty) ...[
              Material(
                // White background to match the theme
                elevation: 1.0, // Light shadow
                borderRadius: BorderRadius.circular(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: SizedBox(
                    height: 50.0, // Reduced height for a smaller suggestion box
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filteredData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            _filteredData[index]['title']!,
                            style: TextStyle(
                              color: Colors.black, // Adjust color of text
                            ),
                          ),
                          onTap: () {
                            _selectReview(_filteredData[index]);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
            // --- TabBar below the Search Bar ---
            Padding(
              padding: const EdgeInsets.only(top: 8.0), // Adjust for spacing
              child: TabBar(
                tabs: [
                  Tab(text: 'Releases'),
                  Tab(text: 'List'),
                  Tab(text: 'Users')
                ],
              ),
            ),
            // --- TabBarView below the TabBar ---
            Expanded(
              child: TabBarView(
                children: [
                  // --- Review Tab ---
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_selectedReview != null) ...[
                          Text(
                            "Results:",
                            style: TextStyle(
                              fontSize: 20, // Change this number to make it bigger or smaller
                              color: Colors.black, // Optional: change text color
                            ),
                          ),
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
                            isListPage: false,
                          ),
                        ],
                      ],
                    ),
                  ),

                  // --- List Tab ---
                  if (_selectedReview != null) ...[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'No results',
                          style: TextStyle(fontSize: 16), // Optional: adjust size
                        ),
                      ),
                    ),
                  ] else ...[

                  ],


                  if (_selectedReview != null) ...[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'No results',
                          style: TextStyle(fontSize: 16), // Optional: adjust size
                        ),
                      ),
                    ),
                  ] else ...[
                    // This is the else block

                  ],
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            handleNavTap(context, index); // use shared nav logic
          },
        ),
      ),
    );
  }
}

