import 'package:food_hub/routes/routes.dart';
import 'package:flutter/material.dart';

class SearchFoodPage extends StatelessWidget {
  const SearchFoodPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Search Food')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(hintText: 'Search food...', prefixIcon: Icon(Icons.search))),
            const SizedBox(height: 16),
            Text('Popular Searches', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(spacing: 8, children: ['Burger', 'Pizza', 'Sushi', 'Salad', 'Pasta'].map((t) => Chip(label: Text(t))).toList()),
            const SizedBox(height: 16),
            Expanded(child: _foodList(context)),
          ],
        ),
      ),
    );
  }

  Widget _foodList(BuildContext ctx) {
    final theme = Theme.of(ctx);
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, i) {
        final price = (i + 5) * 1.5;
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Container(width: 64, height: 64, color: theme.dividerColor, child: const Icon(Icons.fastfood)),
            title: Text('Delicious Item $i', style: theme.textTheme.titleMedium),
            subtitle: Text('From Restaurant $i · \$${price.toStringAsFixed(2)}'),
            trailing: ElevatedButton(onPressed: () {}, child: const Text('Add')),
            onTap: () => Navigator.of(context).pushNamed(Routes.foodDetails),
          ),
        );
      },
    );
  }
}

class SearchRestaurantPage extends StatelessWidget {
  const SearchRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Search Restaurants')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search by name, cuisine...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.tune),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: ['Chinese', 'Italian', 'Japanese', 'American', 'Indian', 'Thai', 'Mexican'].map((c) => FilterChip(label: Text(c), onSelected: (v) {})).toList(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: Container(width: 56, height: 56, color: theme.dividerColor, child: const Icon(Icons.restaurant)),
                      title: Text('Restaurant $i', style: theme.textTheme.titleMedium),
                      subtitle: const Text('4.5 ★ · 25-35 min · \$2.99 delivery'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => Navigator.of(context).pushNamed(Routes.restaurantProfile),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
