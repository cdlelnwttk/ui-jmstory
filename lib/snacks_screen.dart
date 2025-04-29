import 'package:flutter/material.dart';

class Snack {
  final String name;
  final String category;
  final String imagePath;
  final String nutritionalInfo;

  Snack({
    required this.name,
    required this.category,
    required this.imagePath,
    required this.nutritionalInfo,
  });
}

class SnacksScreen extends StatelessWidget {
  final List<Snack> snacks = [
    Snack(
      name: 'Doritos',
      category: 'Chips',
      imagePath: 'assets/doritos.jpeg',
      nutritionalInfo: 'Calories: 140, Protein: 2g, Carbs: 15g, Fat: 8g',
    ),
    Snack(
      name: 'Lays',
      category: 'Chips',
      imagePath: 'assets/lays.jpg',
      nutritionalInfo: 'Calories: 160, Protein: 2g, Carbs: 15g, Fat: 10g',
    ),
    Snack(
      name: 'Snickers',
      category: 'Candy',
      imagePath: 'assets/snickers.jpeg',
      nutritionalInfo: 'Calories: 250, Protein: 4g, Carbs: 35g, Fat: 12g',
    ),
    Snack(
      name: 'Skittles',
      category: 'Candy',
      imagePath: 'assets/skittles.jpeg',
      nutritionalInfo: 'Calories: 230, Protein: 0g, Carbs: 58g, Fat: 4g',
    ),
    Snack(
      name: 'Oreos',
      category: 'Cookies',
      imagePath: 'assets/oreo.jpeg',
      nutritionalInfo: 'Calories: 150, Protein: 1g, Carbs: 22g, Fat: 7g',
    ),
    Snack(
      name: 'Chips Ahoy',
      category: 'Cookies',
      imagePath: 'assets/chipsahoy.jpg',
      nutritionalInfo: 'Calories: 160, Protein: 1g, Carbs: 22g, Fat: 8g',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, List<Snack>> groupedSnacks = {};
    for (var snack in snacks) {
      if (groupedSnacks.containsKey(snack.category)) {
        groupedSnacks[snack.category]!.add(snack);
      } else {
        groupedSnacks[snack.category] = [snack];
      }
    }

    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'SNACK TIME!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Pick your snack:',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              children: groupedSnacks.keys.map((category) {
                return ExpansionTile(
                  title: Text(
                    category,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  children: groupedSnacks[category]!.map((snack) {
                    return ListTile(
                      title: Text(snack.name),
                      onTap: () {
                        // Navigate to the snack detail screen when tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SnackDetailScreen(snack: snack),
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class SnackDetailScreen extends StatelessWidget {
  final Snack snack;

  SnackDetailScreen({required this.snack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(snack.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(snack.imagePath),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Nutritional Information:\n\n${snack.nutritionalInfo}',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SnacksScreen(),
  ));
}
