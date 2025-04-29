import 'package:flutter/material.dart';
import 'meals_screen.dart';
import 'snacks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    DrinkListScreen(),
    MealsScreen(),
    SnacksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'Drinks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Meals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cookie),
            label: 'Snacks',
          ),
        ],
      ),
    );
  }
}

class DrinkListScreen extends StatelessWidget {
  final List<Drink> drinks = [
    Drink(name: 'Coca-Cola', calories: 150, sugar: 39.0, carbs: 39.0, fat: 0.0, category: 'Soda', imagePath: 'assets/cola.jpg'),
    Drink(name: 'Pepsi', calories: 150, sugar: 41.0, carbs: 41.0, fat: 0.0, category: 'Soda', imagePath: 'assets/pepsi.jpeg'),
    Drink(name: 'Orange Juice', calories: 110, sugar: 24.0, carbs: 27.0, fat: 0.2, category: 'Juice', imagePath: 'assets/orange_juice.png'),
    Drink(name: 'Lemonade', calories: 120, sugar: 32.0, carbs: 30.0, fat: 0.1, category: 'Juice', imagePath: 'assets/lemonade.jpeg'),
    Drink(name: 'Red Bull', calories: 110, sugar: 27.0, carbs: 28.0, fat: 0.0, category: 'Energy Drink', imagePath: 'assets/redbull.jpeg'),
    Drink(name: 'Monster', calories: 160, sugar: 40.0, carbs: 40.0, fat: 0.0, category: 'Energy Drink', imagePath: 'assets/monster.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, List<Drink>> groupedDrinks = {};
    for (var drink in drinks) {
      if (groupedDrinks.containsKey(drink.category)) {
        groupedDrinks[drink.category]!.add(drink);
      } else {
        groupedDrinks[drink.category] = [drink];
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'WELCOME!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Pick your drink:',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView(
            children: groupedDrinks.keys.map((category) {
              return ExpansionTile(
                title: Text(
                  category,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                children: groupedDrinks[category]!.map((drink) {
                  return ListTile(
                    title: Text(drink.name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DrinkDetailScreen(drink: drink),
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
    );
  }
}

class Drink {
  final String name;
  final int calories;
  final double sugar;
  final double carbs;
  final double fat;
  final String category;
  final String imagePath;

  Drink({
    required this.name,
    required this.calories,
    required this.sugar,
    required this.carbs,
    required this.fat,
    required this.category,
    required this.imagePath,
  });
}

class DrinkDetailScreen extends StatelessWidget {
  final Drink drink;

  DrinkDetailScreen({required this.drink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drink.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                drink.imagePath,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),
            Text('Calories: ${drink.calories} kcal', style: TextStyle(fontSize: 18)),
            Text('Sugar: ${drink.sugar}g', style: TextStyle(fontSize: 18)),
            Text('Carbs: ${drink.carbs}g', style: TextStyle(fontSize: 18)),
            Text('Fat: ${drink.fat}g', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

