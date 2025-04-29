import 'package:flutter/material.dart';

class AddingPage extends StatefulWidget {
  @override
  _AddingPageState createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> with TickerProviderStateMixin {
  String _selectedType = 'Review';
  late TabController _tabController;

  final List<String> _types = ['Review', 'List'];

  final TextEditingController _albumController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _artistController = TextEditingController();
  final TextEditingController _releaseDateController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _albumController.dispose();
    _titleController.dispose();
    _artistController.dispose();
    _releaseDateController.dispose();
    _genreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Adding "),
            DropdownButton<String>(
              value: _selectedType,
              underline: SizedBox(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedType = newValue!;
                });
              },
              items: _types.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                );
              }).toList(),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Reviews'),
            Tab(text: 'Lists'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_selectedType == 'Review') _buildReviewForm(),
            // If you want to add a "List" form later, handle it here
            SizedBox(height: 20),
            Divider(),
            SizedBox(
              height: 200,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Center(child: Text('Reviews tab content')),
                  Center(child: Text('Lists tab content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Album and Title side-by-side
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _albumController,
                  decoration: InputDecoration(labelText: 'Album'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          TextField(
            controller: _artistController,
            decoration: InputDecoration(labelText: 'Artist'),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _releaseDateController,
            decoration: InputDecoration(labelText: 'Release Date'),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _genreController,
            decoration: InputDecoration(labelText: 'Genre'),
          ),
        ],
      ),
    );
  }
}
