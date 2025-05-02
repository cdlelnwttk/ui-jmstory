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
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
        scaffoldBackgroundColor: Colors.grey[200],
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
  final FocusNode _searchFocus = FocusNode();

  List<Map<String, dynamic>> _reviews = [];
  List<Map<String, dynamic>> _filteredData = [];
  Map<String, dynamic>? _selectedReview;
  bool _showSuggestions = false;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadReviews();
    _searchFocus.addListener(() {
      if (!_searchFocus.hasFocus) {
        setState(() {
          _showSuggestions = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _searchFocus.dispose();
    super.dispose();
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
      length: 3,
      child: Scaffold(
        appBar: AppBar(),
        drawer: CustomDrawer(),
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    focusNode: _searchFocus,
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
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TabBar(
                    tabs: [
                      Tab(text: 'Releases'),
                      Tab(text: 'List'),
                      Tab(text: 'Users')
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (_selectedReview != null) ...[
                              Text(
                                "Results:",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
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
                                number_of_reviews:
                                _selectedReview!['number_of_reviews']!,
                                review: 0,
                                activity: 0,
                                detail: 1,
                                list: 0,
                                charts: 0,
                                outside: 0,
                                imageCreator:
                                _selectedReview!['imageCreator']!,
                                remove: 0,
                                isListPage: false,
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (_selectedReview != null)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'No results',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      else
                        SizedBox.shrink(),
                      if (_selectedReview != null)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'No results',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      else
                        SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
            ),

            if (_showSuggestions && _filteredData.isNotEmpty)
              Positioned(
                left: 16,
                right: 16,
                top: 90,
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 200),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: _filteredData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_filteredData[index]['title']!),
                          onTap: () => _selectReview(_filteredData[index]),
                        );
                      },
                    ),
                  ),
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
            handleNavTap(context, index);
          },
        ),
      ),
    );
  }
}
