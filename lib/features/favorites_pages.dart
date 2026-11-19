import 'package:food_hub/routes/routes.dart';
import 'package:flutter/material.dart';

class FavoritesFoodItemsPage extends StatelessWidget {
  const FavoritesFoodItemsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Foods')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
        children: List.generate(10, (i) => _favFoodCard(context, i, theme)),
      ),
    );
  }

  Widget _favFoodCard(BuildContext ctx, int i, ThemeData theme) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.of(ctx).pushNamed(Routes.foodDetails),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container(color: theme.dividerColor, child: const Center(child: Icon(Icons.fastfood, size: 50)))),
            Padding(padding: const EdgeInsets.all(8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Item $i', style: theme.textTheme.titleSmall),
              Text('\$${((i + 3) * 1.5).toStringAsFixed(2)}', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
            ])),
          ],
        ),
      ),
    );
  }
}

class FavoritesRestaurantsPage extends StatelessWidget {
  const FavoritesRestaurantsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Restaurants')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 8,
        itemBuilder: (context, i) => Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Container(width: 64, height: 64, color: theme.dividerColor, child: const Icon(Icons.restaurant)),
            title: Text(['Pizza Hut', "McDonald's", 'Sushi Master', 'Burger King', 'Starbucks', 'Subway', 'KFC', 'Taco Bell'][i]),
            subtitle: Text(_buildSubtitle(i)),
            trailing: const Icon(Icons.favorite, color: Colors.red),
            onTap: () => Navigator.of(context).pushNamed(Routes.restaurantProfile),
          ),
        ),
      ),
    );
  }

  String _buildSubtitle(int i) {
    final rating = (4.9 - i * 0.1).toStringAsFixed(1);
    final timeRange = '${((i + 10) * 5)}-${((i + 15) * 5)}';
    return '$rating ★ · $timeRange min';
  }
}

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Rating')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 2),
            Icon(Icons.photo_library, size: 120, color: theme.dividerColor),
            const SizedBox(height: 8),
            TextButton(onPressed: () {}, child: const Text('Add Photo')),
            const Divider(height: 32),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [for (int i = 1; i <= 5; i++) IconButton(icon: Icon(i <= 4 ? Icons.star : Icons.star_border, color: Colors.amber, size: 40), onPressed: () {})]),
            const SizedBox(height: 8),
            Text('Overall Rating: 4.0', textAlign: TextAlign.center, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 32),
            TextField(decoration: const InputDecoration(hintText: 'Write your review...', alignLabelWithHint: true, border: OutlineInputBorder()), maxLines: 4),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Submit Rating')),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
