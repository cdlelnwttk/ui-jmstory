import 'package:flutter/material.dart';
import 'feed.dart';
import 'package:untitled3/data/release_card_data.dart';
import 'bottom_nav.dart';
import 'nav_logic.dart';
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

  List<Map<String, String>> feedItems = [
    {'title': 'Album One', 'artist': 'Artist A'},
    {'title': 'Album Two', 'artist': 'Artist B'},
    {'title': 'Single One', 'artist': 'Artist C'},
    {'title': 'Album Three', 'artist': 'Artist D'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charts'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton<String>(
                        value: selectedQualifer,
                        dropdownColor: Colors.white,
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
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton<String>(
                        value: selectedReleaseType,
                        dropdownColor: Colors.white,
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
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton<String>(
                        value: selectedYear,
                        dropdownColor: Colors.white,
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
              ],
            ),
          ),
          Expanded(
            child: FeedList(items: reviews, a: 0, b: 0, c:0, d:1, f:1),
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
