import 'package:flutter/material.dart';
import 'new_page.dart'; // Import the new page
import 'album_widget.dart';
import 'package:untitled3/data/release_card_data.dart';
import 'bottom_nav.dart';
import 'feed.dart';
import 'charts.dart';
import 'search.dart';
import 'review_widget.dart'; // Import the file containing CustomRowWidget
import 'user_feed.dart';
import 'package:untitled3/data/user_info_data.dart';
import 'drawer.dart';
import 'nav_logic.dart';
import 'feed_list.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 4) {  // Profile tab is at index 4
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewPage(initialTabIndex: 0),  // Navigate to ProfilePage
        ),
      );
    }
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChartsPage(),  // Navigate to ProfilePage
        ),
      );
    }
    if (index == 1){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()),
      );

    }
    if (index == 0){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );

    }
    if (index == 2){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      drawer: CustomDrawer(),
      body: _selectedIndex == 0
          ? DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Featured Reviews'),
                Tab(text: 'Featured Lists'),
                Tab(text: 'Friend\'s Reviews'),
                Tab(text: 'Friend\'s Lists'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FeedList(items: reviews, a: 1, b: 0, c: 0, d: 0, f: 0, j: 0, remove: 0, fromProfile: false),
                  FeedList(items: reviews, a: 0, b: 0, c: 1, d: 0, f: 0, j: 0, remove: 0, fromProfile: false),
                  FeedList(items: reviews, a: 1, b: 0, c: 0, d: 0, f: 0, j: 0, remove: 0, fromProfile: false),
                  FeedList(items: reviews, a: 0, b: 1, c: 0, d: 0, f: 0, j: 0, remove: 0, fromProfile: false),
                ],
              ),
            ),
          ],
        ),
      )
          : Center(
        child: Text(
          'Selected Index: $_selectedIndex',
          style: TextStyle(fontSize: 24),
        ),
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




