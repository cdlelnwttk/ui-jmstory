import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'album_widget.dart';

class ListTabWidget extends StatefulWidget {
  final List<Map<String, dynamic>> reviews;

  const ListTabWidget({Key? key, required this.reviews}) : super(key: key);

  @override
  _ListTabWidgetState createState() => _ListTabWidgetState();
}

class _ListTabWidgetState extends State<ListTabWidget> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  List<Map<String, dynamic>> _filteredData = [];
  File? _pickedImage;
  bool _showSuggestions = false;
  Map<String, dynamic>? _selectedItem;

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

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _pickedImage = File(picked.path);
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _descController.dispose();
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

            // Image picker (always visible)
            Row(
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.photo),
                  label: Text('Pick Image'),
                  onPressed: _pickImage,
                ),
                SizedBox(width: 10),
                if (_pickedImage != null)
                  Image.file(_pickedImage!, width: 100, height: 100),
                if (_pickedImage == null)
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[300],
                    child: Icon(Icons.image, size: 40),
                  ),
              ],
            ),
            SizedBox(height: 16),

            // Description box (always visible)
            TextField(
              controller: _descController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
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
                child: CustomInfoCard(
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
              ),
          ],
        ),
      ),
    );
  }
}

