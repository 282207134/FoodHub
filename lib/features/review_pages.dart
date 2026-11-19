import 'package:flutter/material.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reviews')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _reviewHeader(context, '4.5', ['Excellent', 'Good', 'Average', 'Fair', 'Poor'], [60, 25, 10, 3, 2]),
          const SizedBox(height: 24),
          _reviewCard(context, 'John D.', '5.0', 'Amazing pizza! Best in town.', '2 weeks ago'),
          _reviewCard(context, 'Sarah M.', '4.0', 'Good food but delivery took a bit long.', '1 month ago'),
          _reviewCard(context, 'Mike R.', '5.0', 'Love the new menu items!', '3 weeks ago'),
          _reviewCard(context, 'Emily L.', '3.0', 'Average experience, nothing special.', '2 months ago'),
        ],
      ),
    );
  }

  Widget _reviewHeader(BuildContext ctx, String avg, List<String> labels, List<int> percents) {
    final theme = Theme.of(ctx);
    return Card(
      child: Padding(padding: const EdgeInsets.all(16), child: Column(
        children: [
          Text(avg, style: theme.textTheme.displayLarge?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
          Text('Average Rating', style: theme.textTheme.bodySmall),
          const SizedBox(height: 16),
          ...labels.asMap().entries.map((e) => Padding(padding: const EdgeInsets.only(bottom: 4), child: Row(children: [
            Text(e.value, style: theme.textTheme.bodySmall),
            const SizedBox(width: 8),
            Expanded(child: LinearProgressIndicator(value: percents[e.key] / 100, minHeight: 8, backgroundColor: theme.dividerColor)),
            Text('${percents[e.key]}%', style: theme.textTheme.bodySmall),
          ]))),
        ],
      )),
    );
  }

  Widget _reviewCard(BuildContext ctx, String author, String rating, String text, String time) {
    final theme = Theme.of(ctx);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(padding: const EdgeInsets.all(12), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [CircleAvatar(child: Text(author[0], style: const TextStyle(fontWeight: FontWeight.bold))), const SizedBox(width: 12), Expanded(child: Text(author, style: theme.textTheme.titleMedium)), Text('$rating ★', style: theme.textTheme.bodySmall)],),
          const SizedBox(height: 8),
          Text(text, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 8),
          Text(time, style: theme.textTheme.bodySmall),
        ],
      )),
    );
  }
}

class ReviewFoodPage extends StatelessWidget {
  const ReviewFoodPage({super.key});
  @override
  Widget build(BuildContext context) => _reviewFormPage(context, 'Ground Beef');
}

class ReviewRestaurantPage extends StatelessWidget {
  const ReviewRestaurantPage({super.key});
  @override
  Widget build(BuildContext context) => _reviewFormPage(context, 'Pizza Hut');
}

Widget _reviewFormPage(BuildContext context, String itemName) {
  final theme = Theme.of(context);
  return Scaffold(
    appBar: AppBar(title: Text('Review $itemName')),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("How was your last order from $itemName?", textAlign: TextAlign.center, style: theme.textTheme.headlineSmall),
          const SizedBox(height: 32),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [for (int i = 1; i <= 5; i++) IconButton(icon: Icon(i <= 4 ? Icons.star : Icons.star_border, color: Colors.amber, size: 40), onPressed: () {})]),
          const SizedBox(height: 24),
          TextField(decoration: const InputDecoration(hintText: 'Write a review...', alignLabelWithHint: true, border: OutlineInputBorder()), maxLines: 4),
          const SizedBox(height: 32),
          ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Submit Review')),
        ],
      ),
    ),
  );
}
