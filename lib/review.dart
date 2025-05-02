import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/album_widget.dart';
import 'star_rating.dart';
import 'dart:io';
import 'list_tab_widget.dart';
import 'review_screen.dart';
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
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Review'),
              Tab(text: 'List'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        drawer: CustomDrawer(),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  TextField(
                    controller: _searchController,
                    onChanged: _searchData,
                    onSubmitted: _onSearchSubmit,
                    decoration: const InputDecoration(
                      labelText: 'Search Titles',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (_showSuggestions && _filteredData.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _filteredData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_filteredData[index]['title']!),
                          onTap: () => _selectReview(_filteredData[index]),
                        );
                      },
                    ),
                  const SizedBox(height: 10),
                  if (_selectedReview != null)
                    ReviewDisplay(
                      review: _selectedReview!,
                      controller: _textController,
                    ),
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




