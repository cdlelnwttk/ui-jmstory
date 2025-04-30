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
        title: Text('Music Review App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/space.jpg'), // Local asset image
                  fit: BoxFit.cover,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewPage(initialTabIndex: 0),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/red.jpg'), // Local asset image
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'user@example.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPage(initialTabIndex: 0),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Activity'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPage(initialTabIndex: 1),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.rate_review),
              title: Text('Reviews'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPage(initialTabIndex: 2),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Lists'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPage(initialTabIndex: 3),
                  ),
                );
              },
            ),
          ],
        ),
      ),
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
                  FeedList(items: reviews, a: 1, b: 0, c: 0, d: 0, f: 0),
                  FeedList(items: reviews, a: 0, b: 0, c: 1, d: 0, f: 0),
                  FeedList(items: reviews, a: 1, b: 0, c: 0, d: 0, f: 0),
                  FeedList(items: reviews, a: 0, b: 1, c: 0, d: 0, f: 0),
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
      // Use the CustomBottomNavBar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}




