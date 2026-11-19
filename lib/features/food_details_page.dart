import 'package:food_hub/routes/routes.dart';
import 'package:flutter/material.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(color: theme.dividerColor, child: const Center(child: Icon(Icons.fastfood, size: 120))),
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
                      Expanded(child: Text('Gourmet Burger', style: theme.textTheme.headlineSmall)),
                      Text('\$12.99', style: theme.textTheme.headlineMedium?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 18, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text('4.8 (234 reviews)', style: theme.textTheme.bodySmall),
                      const SizedBox(width: 16),
                      const Icon(Icons.time_to_leave, size: 18),
                      const SizedBox(width: 4),
                      Text('25-35 min', style: theme.textTheme.bodySmall),
                    ],
                  ),
                  const Divider(height: 24),
                  Text('Description', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text('Juicy beef patty with fresh lettuce, tomato, and our special sauce.', style: theme.textTheme.bodyMedium),
                  const Divider(height: 24),
                  Text('Customize', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  _OptionRow('Extra Cheese', '+\$1.50'),
                  _OptionRow('Bacon', '+\$2.00'),
                  _OptionRow('No Onions', ''),
                  const Divider(height: 32),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: _BottomBarDelegate(theme),
            pinned: true,
          ),
        ],
      ),
    );
  }
}

class _OptionRow extends StatelessWidget {
  final String name;
  final String price;
  const _OptionRow(this.name, this.price);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(price.isEmpty ? 'Free' : price, style: Theme.of(context).textTheme.bodySmall),
      trailing: IconButton(icon: const Icon(Icons.add_circle_outline), onPressed: () {}),
    );
  }
}

class _BottomBarDelegate extends SliverPersistentHeaderDelegate {
  final ThemeData theme;
  _BottomBarDelegate(this.theme);
  @override
  double get maxExtent => 80;
  @override
  double get minExtent => 80;
  @override
  Widget build(context, shrinkOffset, overscrollPercent) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: theme.cardColor, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, -2))]),
      child: Row(
        children: [
          Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Total', style: theme.textTheme.bodySmall),
            Text('\$12.99', style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
          ]),
          const Spacer(),
          ElevatedButton.icon(onPressed: () => Navigator.of(context).pushNamed(Routes.cart), icon: const Icon(Icons.shopping_cart), label: const Text('Add to Cart')),
        ],
      ),
    );
  }
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate old) => false;
}
