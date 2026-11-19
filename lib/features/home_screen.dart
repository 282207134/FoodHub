import 'package:food_hub/routes/routes.dart';
import 'package:food_hub/features/search_pages.dart';
import 'package:food_hub/features/cart_page.dart';
import 'package:food_hub/features/profile_page.dart';
import 'package:flutter/material.dart';

/// Home screen with search bar, categories, restaurant list, and bottom nav.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const _HomeContent(),
    const SearchFoodPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 140,
            floating: false,
            pinned: true,
            backgroundColor: theme.colorScheme.primary,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('FoodHub', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              centerTitle: true,
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
            ),
            actions: [
              IconButton(icon: const Icon(Icons.notifications_outlined, color: Colors.white), onPressed: () {}),
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Navigator.of(context).pushNamed(Routes.sideMenu),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(color: theme.cardColor, borderRadius: BorderRadius.circular(12), boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))
                    ]),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 12),
                        Expanded(child: Text('Search food or restaurant...', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey))),
                        IconButton(icon: const Icon(Icons.tune), onPressed: () => Navigator.of(context).pushNamed(Routes.filter)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text('Categories', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: ['🍔', '🍕', '🍜', '🥗', '🍣', '☕', '🍰'].map((e) {
                        final labels = ['Burger', 'Pizza', 'Noodle', 'Salad', 'Sushi', 'Coffee', 'Cake'];
                        int idx = ['🍔', '🍕', '🍜', '🥗', '🍣', '☕', '🍰'].indexOf(e);
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: InkWell(
                            onTap: () => Navigator.of(context).pushNamed(Routes.category),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(width: 56, height: 56, decoration: BoxDecoration(color: theme.colorScheme.primaryContainer, borderRadius: BorderRadius.circular(16)), child: Center(child: Text(e, style: const TextStyle(fontSize: 28)))),
                                const SizedBox(height: 4),
                                Text(labels[idx], style: theme.textTheme.labelSmall),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Popular Restaurants', style: theme.textTheme.titleLarge),
                      TextButton(onPressed: () => Navigator.of(context).pushNamed(Routes.searchRestaurant), child: const Text('See All')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) => _RestaurantCard(i),
                      childCount: 5,
                    ),
                  )
                    .wrapSliver(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension on SliverList {
  Widget wrapSliver() => this;
}

class _RestaurantCard extends StatelessWidget {
  final int index;
  const _RestaurantCard(this.index);

  static final data = [
    {'name': 'Pizza Hut', 'rating': 4.8, 'time': '25-35 min', 'delivery': '\$2.99', 'tags': ['Italian', 'Pizza']},
    {'name': 'McDonald\'s', 'rating': 4.5, 'time': '15-25 min', 'delivery': 'Free', 'tags': ['Burger', 'Fast Food']},
    {'name': 'Sushi Master', 'rating': 4.9, 'time': '30-40 min', 'delivery': '\$1.99', 'tags': ['Japanese', 'Sushi']},
    {'name': 'Burger King', 'rating': 4.3, 'time': '20-30 min', 'delivery': '\$1.49', 'tags': ['Burger', 'American']},
    {'name': 'Starbucks', 'rating': 4.7, 'time': '10-20 min', 'delivery': '\$0.99', 'tags': ['Coffee', 'Snacks']},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final item = data[index];
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(Routes.restaurantProfile),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(width: 80, height: 80, decoration: BoxDecoration(color: theme.dividerColor, borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.restaurant, size: 40, color: Colors.grey)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['name'] as String, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text('${item['rating']}', style: theme.textTheme.bodySmall),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 4,
                      children: (item['tags']! as List<String>).map((t) => Chip(label: Text(t, style: const TextStyle(fontSize: 10)), padding: EdgeInsets.zero, visualDensity: VisualDensity.compact)).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  Text(item['delivery'] as String, style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
