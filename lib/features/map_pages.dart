import 'package:food_hub/routes/routes.dart';
import 'package:flutter/material.dart';

class MapViewPage extends StatelessWidget {
  const MapViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map View')),
      body: Stack(
        children: [
          Container(color: Colors.grey[200], child: const Center(child: Icon(Icons.map, size: 100, color: Colors.grey))),
          Positioned(bottom: 0, left: 0, right: 0, child: _mapBottomSheet(context)),
        ],
      ),
    );
  }

  Widget _mapBottomSheet(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: theme.cardColor, borderRadius: const BorderRadius.vertical(top: Radius.circular(16)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nearby Restaurants', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          ...['Pizza Hut (0.3 mi)', "McDonald's (0.5 mi)", 'Starbucks (0.2 mi)'].map((text) => ListTile(
            leading: const CircleAvatar(child: Icon(Icons.restaurant)),
            title: Text(text),
            onTap: () => Navigator.of(context).pushNamed(Routes.restaurantProfile),
          )),
        ],
      ),
    );
  }
}

class MapOrderTrackingPage extends StatelessWidget {
  const MapOrderTrackingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Tracking')),
      body: Stack(
        children: [
          Container(color: Colors.grey[200], child: const Center(child: Icon(Icons.map, size: 120, color: Colors.grey))),
          const Positioned(top: 80, left: 50, child: Icon(Icons.location_on, size: 40, color: Colors.red)),
          const Positioned(top: 200, left: 150, child: Icon(Icons.two_wheeler, size: 40, color: Colors.orange)),
          Positioned(bottom: 0, left: 0, right: 0, child: _trackingBottomSheet(context)),
        ],
      ),
    );
  }

  Widget _trackingBottomSheet(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: theme.cardColor, borderRadius: const BorderRadius.vertical(top: Radius.circular(16)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [const Icon(Icons.timeline, color: Colors.green), const SizedBox(width: 8), Text('Arriving in 15 min', style: theme.textTheme.titleMedium)]),
          const SizedBox(height: 16),
          LinearProgressIndicator(value: 0.7, minHeight: 6, backgroundColor: theme.dividerColor),
          const SizedBox(height: 16),
          Row(children: [const Icon(Icons.person), const SizedBox(width: 8), const Text('Driver: Mike')]),
          const SizedBox(height: 8),
          Row(children: [const Icon(Icons.star, color: Colors.amber), const SizedBox(width: 4), const Text('4.9'), const Spacer(), OutlinedButton(onPressed: () {}, child: const Text('Contact Driver'))]),
        ],
      ),
    );
  }
}

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delivery Time', style: theme.textTheme.titleMedium),
            Wrap(spacing: 8, children: ['Any', '< 20 min', '< 30 min', '< 45 min'].map((t) => ChoiceChip(label: Text(t), selected: false, onSelected: (_) {})).toList()),
            const SizedBox(height: 24),
            Text('Price Range', style: theme.textTheme.titleMedium),
            Slider(value: 0.5, onChanged: (v) {}),
            Row(children: [Text('\$0'), Expanded(child: Container()), Text('\$50+')]),
            const SizedBox(height: 24),
            Text('Rating', style: theme.textTheme.titleMedium),
            Wrap(spacing: 8, children: ['Any', '3+ ★', '4+ ★', '4.5+ ★'].map((t) => ChoiceChip(label: Text(t), selected: false, onSelected: (_) {})).toList()),
            const SizedBox(height: 32),
            Row(children: [OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Clear')), const Spacer(), ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Apply Filters'))]),
          ],
        ),
      ),
    );
  }
}
