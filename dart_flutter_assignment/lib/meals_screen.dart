import 'package:flutter/material.dart';

class Meal {
  final String name;
  final String category;
  final String imagePath;
  final String nutritionalInfo;

  Meal({
    required this.name,
    required this.category,
    required this.imagePath,
    required this.nutritionalInfo,
  });
}

class MealsScreen extends StatelessWidget {
  final List<Meal> meals = [
    Meal(
      name: 'Pancakes',
      category: 'Breakfast',
      imagePath: 'assets/pancakes.jpg',
      nutritionalInfo: 'Calories: 350, Protein: 6g, Carbs: 45g, Fat: 14g',
    ),
    Meal(
      name: 'Omelette',
      category: 'Breakfast',
      imagePath: 'assets/omelette.jpeg',
      nutritionalInfo: 'Calories: 250, Protein: 20g, Carbs: 2g, Fat: 18g',
    ),
    Meal(
      name: 'Sandwich',
      category: 'Lunch',
      imagePath: 'assets/sandwich.jpg',
      nutritionalInfo: 'Calories: 400, Protein: 15g, Carbs: 50g, Fat: 18g',
    ),
    Meal(
      name: 'Salad',
      category: 'Lunch',
      imagePath: 'assets/salad.jpg',
      nutritionalInfo: 'Calories: 150, Protein: 5g, Carbs: 20g, Fat: 5g',
    ),
    Meal(
      name: 'Steak',
      category: 'Dinner',
      imagePath: 'assets/steak.jpg',
      nutritionalInfo: 'Calories: 600, Protein: 45g, Carbs: 5g, Fat: 40g',
    ),
    Meal(
      name: 'Pasta',
      category: 'Dinner',
      imagePath: 'assets/pasta.jpeg',
      nutritionalInfo: 'Calories: 500, Protein: 20g, Carbs: 70g, Fat: 15g',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, List<Meal>> groupedMeals = {};
    for (var meal in meals) {
      if (groupedMeals.containsKey(meal.category)) {
        groupedMeals[meal.category]!.add(meal);
      } else {
        groupedMeals[meal.category] = [meal];
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
                  'WELCOME TO MEALS!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Pick your meal:',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              children: groupedMeals.keys.map((category) {
                return ExpansionTile(
                  title: Text(
                    category,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  children: groupedMeals[category]!.map((meal) {
                    return ListTile(
                      title: Text(meal.name),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MealDetailScreen(meal: meal),
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

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  MealDetailScreen({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(meal.imagePath),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Nutritional Information:\n\n${meal.nutritionalInfo}',
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
    home: MealsScreen(),
  ));
}

