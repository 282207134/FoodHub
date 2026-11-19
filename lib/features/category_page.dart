import 'package:food_hub/routes/routes.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  static final categories = [
    {'name': 'Burgers', 'icon': '🍔'},
    {'name': 'Pizza', 'icon': '🍕'},
    {'name': 'Asian', 'icon': '🍜'},
    {'name': 'Healthy', 'icon': '🥗'},
    {'name': 'Sushi', 'icon': '🍣'},
    {'name': 'Desserts', 'icon': '🍰'},
    {'name': 'Drinks', 'icon': '☕'},
    {'name': 'Mexican', 'icon': '🌮'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: categories.map((cat) {
            final name = cat['name'] as String;
            final icon = cat['icon'] as String;
            return Card(
              child: InkWell(
                onTap: () => Navigator.of(context).pushNamed(Routes.searchRestaurant),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(icon, style: const TextStyle(fontSize: 48)),
                      const SizedBox(height: 12),
                      Text(name, style: theme.textTheme.titleMedium, textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
