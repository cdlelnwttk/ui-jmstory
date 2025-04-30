import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search and Widget Example',
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
  final TextEditingController _textBoxController = TextEditingController();

  // Sample data with titles and additional info
  final List<Map<String, String>> _data = [
    {'title': 'Flutter Tutorial', 'description': 'Learn Flutter step by step'},
    {'title': 'Dart Basics', 'description': 'Introduction to Dart programming'},
    {'title': 'State Management', 'description': 'Managing state in Flutter apps'},
    {'title': 'Networking in Flutter', 'description': 'Making HTTP requests in Flutter'},
    {'title': 'Flutter Widgets', 'description': 'Understanding Flutter widgets'},
  ];

  // Store filtered results based on search
  List<Map<String, String>> _filteredData = [];

  // Store the currently selected item to display the widget
  Map<String, String>? _selectedItem;

  // Method to filter data based on search query
  void _searchData(String query) {
    setState(() {
      _filteredData = _data
          .where((item) => item['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // Method to handle selection of a title
  void _selectItem(Map<String, String> item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search and Widget Example')),
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

            // Display search results
            _filteredData.isNotEmpty
                ? ListView.builder(
              shrinkWrap: true,
              itemCount: _filteredData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredData[index]['title']!),
                  onTap: () => _selectItem(_filteredData[index]),
                );
              },
            )
                : Text('No results found'),

            SizedBox(height: 20),

            // Display selected item widget
            if (_selectedItem != null) ...[
              Text('Selected Item:'),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.blueAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title: ${_selectedItem!['title']}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 10),
                    Text('Description: ${_selectedItem!['description']}'),
                  ],
                ),
              ),
            ],

            SizedBox(height: 20),

            // Large Text Box for user input
            TextField(
              controller: _textBoxController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Write something...',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
