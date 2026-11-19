import 'package:food_hub/routes/routes.dart';
import 'package:flutter/material.dart';

class RestaurantProfilePage extends StatelessWidget {
  const RestaurantProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(color: Colors.grey[300], child: const Center(child: Icon(Icons.restaurant, size: 80))),
            ),
            actions: [
              IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
              IconButton(icon: const Icon(Icons.share), onPressed: () {}),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pizza Hut', style: theme.textTheme.headlineSmall),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(color: theme.colorScheme.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                        child: Text('Open', style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 18, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text('4.8 (1,234)', style: theme.textTheme.bodyMedium),
                      const SizedBox(width: 16),
                      const Icon(Icons.time_to_leave, size: 18),
                      const SizedBox(width: 4),
                      Text('25-35 min', style: theme.textTheme.bodyMedium),
                      const SizedBox(width: 16),
                      Text('\$2.99 delivery', style: theme.textTheme.bodyMedium),
                    ],
                  ),
                  const Divider(height: 24),
                  Text('About', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text('Classic Italian-American cuisine featuring hand-tossed pizzas, pasta dishes, and signature wings.', style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 16),
                  Row(
                    children: ['🍕 Pizza', '🥗 Salads', '🍝 Pasta', '🍗 Wings'].map((tag) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Chip(label: Text(tag, style: const TextStyle(fontSize: 12))),
                    )).toList(),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Menu', style: theme.textTheme.titleLarge),
                      TextButton(onPressed: () {}, child: const Text('See All')),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(width: 64, height: 64, color: theme.dividerColor, child: const Icon(Icons.fastfood)),
                    title: Text(['Margherita Pizza', 'Pepperoni Pizza', 'BBQ Chicken Pizza', 'Veggie Supreme'][i % 4]!, style: theme.textTheme.titleMedium),
                    subtitle: Text(['Fresh mozzarella', 'Spicy pepperoni', 'Smoky BBQ sauce', 'Garden vegetables'][i % 4]!),
                    trailing: Text('\$${(8.99 + i * 2)}.99', style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.primary)),
                    onTap: () => Navigator.of(context).pushNamed(Routes.foodDetails),
                  ),
                ),
                childCount: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
