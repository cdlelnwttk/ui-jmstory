import 'package:flutter/material.dart';
import 'album_widget.dart';

class ListTabWidget extends StatefulWidget {
  final List<Map<String, dynamic>> reviews;
  final String? listName;
  final String? description;
  final String? imagePath;
  final List<Map<String, dynamic>>? initialFeed;

  const ListTabWidget({
    Key? key,
    required this.reviews,
    this.listName,
    this.description,
    this.imagePath,
    this.initialFeed,
  }) : super(key: key);

  @override
  _ListTabWidgetState createState() => _ListTabWidgetState();
}

class _ListTabWidgetState extends State<ListTabWidget> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _listNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  List<Map<String, dynamic>> _filteredData = [];
  List<Map<String, dynamic>> _feed = [];
  Map<String, dynamic>? _selectedItem;

  bool _showSuggestions = false;
  bool _showSearchView = false; // This controls which part of the screen is shown
  late String _imagePath;

  @override
  void initState() {
    super.initState();
    _filteredData = List.from(widget.reviews);
    _listNameController.text = widget.listName ?? '';
    _descriptionController.text = widget.description ?? '';
    _feed = List.from(widget.initialFeed ?? []);
    _imagePath = widget.imagePath ?? 'assets/space.jpg';
  }

  void _search(String query) {
    setState(() {
      _filteredData = widget.reviews
          .where((item) =>
          item['title']!.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
      _showSuggestions = query.isNotEmpty && _filteredData.isNotEmpty;
    });
  }

  void _clearSelectedItem() {
    setState(() {
      _selectedItem = null;
      _showSuggestions = false;
    });
  }

  void _addToFeed(Map<String, dynamic> item) {
    setState(() {
      _feed.add(item);
    });
  }

  void _toggleSearchView() {
    setState(() {
      _showSearchView = !_showSearchView;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _listNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // If not in search view, show initial details (list name, image, description)
            if (!_showSearchView) ...[
              TextField(
                controller: _listNameController,
                decoration: InputDecoration(
                  labelText: 'List Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Image with Icon Overlay
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        _imagePath,
                        width: 300,
                        height: 300,
                      ),
                      Positioned(
                        top: 50,
                        right: 30,
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Description
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
                minLines: 2,
              ),
              SizedBox(height: 16),
            ],

            // Row with buttons for both "Update List Picture" and "Go to Search"
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center the "Update List Items" button above the title text box
                Center(
                  child: ElevatedButton(
                          onPressed: _toggleSearchView,
                          child: Text(_showSearchView ? "Update List Details" : "Update List Items"),
                  ),

                ),
                SizedBox(height: 16),
                // Space between the button and title text box
              ],
            ),

            // If in search view, show search bar and suggestions
            if (_showSearchView) ...[
              // Search bar
              TextField(
                controller: _searchController,
                onChanged: _search,
                decoration: InputDecoration(
                  labelText: 'Search Releases to Add',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 16),

              // Suggestions
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

              // Selected Item Card
              if (_selectedItem != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Stack(
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
                            detail: 1,
                            list: 0,
                            charts: 0,
                            outside: 0,
                            imageCreator: _selectedItem!['imageCreator'],
                            remove: 0,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: _clearSelectedItem,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (_selectedItem != null) {
                            _addToFeed(_selectedItem!);
                          }
                        },
                        child: Text("Add to list"),
                      ),
                    ],
                  ),
                ),
            ],

            // Displaying the feed items
            if (_feed.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your list:'),
                    for (var item in _feed)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: CustomInfoCard(
                          imagePath: item['image'],
                          name: item['title'],
                          description: item['description'],
                          size: 150,
                          reviewedBy: item['reviewedBy'],
                          listBy: item['createdBy'],
                          reviewer: item['reviewer'],
                          creator: item['creator'],
                          rating: item['rating'],
                          year: item['year'],
                          number: item['number'],
                          genre: item['genre'],
                          artist: item['artist'],
                          number_of_reviews: item['number_of_reviews'],
                          review: 0,
                          activity: 0,
                          detail: 1,
                          list: 0,
                          charts: 0,
                          outside: 0,
                          imageCreator: item['imageCreator'],
                          remove: _showSearchView
                              ? 1
                              : 0, // Remove is 0 when title, image, and description are visible, 1 when the search bar is visible
                        ),
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



