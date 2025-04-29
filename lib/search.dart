import 'package:flutter/material.dart';
import 'bottom_nav.dart';
import 'nav_logic.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

int _selectedIndex = 0;

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  List<String> allItems = [
    'Previous Misc Album',
    'Previous Misc Single',
    'Previous Misc Profile',
    'Previous Misc List',
  ];
  List<String> filteredItems = [];

  bool _showList = false;

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      _filterSearchResults(_searchController.text);
    });

    _focusNode.addListener(() {
      setState(() {
        _showList = _focusNode.hasFocus;
      });
    });
  }

  void _filterSearchResults(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = allItems;
      } else {
        filteredItems = allItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _searchController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            if (_showList)
              Expanded(
                child: filteredItems.isNotEmpty
                    ? ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filteredItems[index]),
                    );
                  },
                )
                    : Center(child: Text('No results found')),
              ),
          ],
        ),
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
    );
  }
}

