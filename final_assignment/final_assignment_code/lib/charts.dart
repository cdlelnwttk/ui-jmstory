import 'package:flutter/material.dart';
import 'feed.dart';
import 'package:untitled3/data/release_card_data.dart';
import 'bottom_nav.dart';
import 'nav_logic.dart';
import 'drawer.dart';
import 'feed_list.dart';

class ChartsPage extends StatefulWidget {
  @override
  _ChartsPageState createState() => _ChartsPageState();
}

int _selectedIndex = 0;

class _ChartsPageState extends State<ChartsPage> {
  String selectedType = 'Album';
  String selectedYear = '2024';
  String selectedQualifer = 'Top Rated';
  String selectedReleaseType = 'Albums';

  final List<String> years = ['2024', '2023', '2022'];
  final List<String> qualifer = ['Top Rated', 'Most Popular'];
  final List<String> release_type = ['Albums', 'Singles'];

  final TextEditingController _textController = TextEditingController();
  final List<String> userEntries = [];

  List<Map<String, String>> feedItems = [
    {'title': 'Album One', 'artist': 'Artist A'},
    {'title': 'Album Two', 'artist': 'Artist B'},
    {'title': 'Single One', 'artist': 'Artist C'},
    {'title': 'Album Three', 'artist': 'Artist D'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton<String>(
                        value: selectedQualifer,
                        onChanged: (value) {
                          setState(() {
                            selectedQualifer = value!;
                          });
                        },
                        items: qualifer.map((qualifer) {
                          return DropdownMenuItem(
                            value: qualifer,
                            child: Text(qualifer),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton<String>(
                        value: selectedReleaseType,
                        onChanged: (value) {
                          setState(() {
                            selectedReleaseType = value!;
                          });
                        },
                        items: release_type.map((release_type) {
                          return DropdownMenuItem(
                            value: release_type,
                            child: Text(release_type),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text("of", style: TextStyle(fontSize: 16)),
                    SizedBox(width: 15),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton<String>(
                        value: selectedYear,
                        onChanged: (value) {
                          setState(() {
                            selectedYear = value!;
                          });
                        },
                        items: years.map((year) {
                          return DropdownMenuItem(
                            value: year,
                            child: Text(year),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _textController,
                  onSubmitted: (value) {
                    if (value.trim().isNotEmpty) {
                      setState(() {
                        userEntries.add(value.trim());
                        _textController.clear();
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter Genres to Include',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: userEntries.map((entry) {
                    return ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(entry),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: FeedList(
              items: reviews,
              a: 0,
              b: 0,
              c: 0,
              d: 1,
              f: 1,
              j: 0,
              remove: 0,
              fromProfile: false,
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
    );
  }
}