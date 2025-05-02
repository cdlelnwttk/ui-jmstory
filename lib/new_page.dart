import 'package:flutter/material.dart';
import 'edit_profile.dart';
import 'album_widget.dart';
import 'package:untitled3/data/release_card_data.dart';
import 'bottom_nav.dart';
import 'main.dart';
import 'nav_logic.dart';
import 'review_widget.dart'; // Import the file containing CustomRowWidget
import 'user_feed.dart';
import 'package:untitled3/data/user_info_data.dart';
import 'drawer.dart';
import 'feed_list.dart';
class NewPage extends StatefulWidget {
  final int initialTabIndex;

  NewPage({Key? key, required this.initialTabIndex}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  final List<String> albumImages = [
    'assets/grace.jpg',
    'assets/goo.jpg',
    'assets/mellon.jpg',
    'assets/youdpreferanastronaut.png',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: widget.initialTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    }
  }

  void _navigateToAlbumDetail(String albumImage, ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlbumDetailPage(imagePath: albumImage, ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/space.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 20,
                  bottom: 10,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/red.jpg'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'example_display_name',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'example_user_name',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfilePage()),
                    );
                  },
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ),
          TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: [
              Tab(text: 'Favorites'),
              Tab(text: 'Activity'),
              Tab(text: 'Reviews'),
              Tab(text: 'Lists'),
              Tab(text: 'Friends')
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Favorite Singles',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 4, // 2x2 = 4 items
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                _navigateToAlbumDetail(albumImages[index % albumImages.length]);
                              },
                              child: Image.asset(
                                albumImages[index % albumImages.length],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Favorite Albums',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 4, // 2x2 = 4 items
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                _navigateToAlbumDetail(albumImages[(index) % albumImages.length]);
                              },
                              child: Image.asset(
                                albumImages[index % albumImages.length],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
,
                FeedList(items: reviewsYou, a: 1, b: 1, c: 0, d: 0, f: 0, j: 0, remove: 0, fromProfile: false),
                FeedList(items: reviewsYou, a: 1, b: 0, c: 0, d: 0, f: 0, j: 0, remove: 0, fromProfile: false),
                FeedList(items: listsYou, a: 0, b: 0, c: 1, d: 0, f: 0, j: 0, remove: 0, fromProfile: false),
                FeedPage(users: users,  a: 0),
              ],
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

class AlbumDetailPage extends StatelessWidget {
  final String imagePath;

  const AlbumDetailPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Album Detail')),
      body: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}









