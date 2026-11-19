import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.feedback, size: 80, color: theme.colorScheme.primary.withOpacity(0.5)),
            const SizedBox(height: 24),
            Text('Share Your Feedback', textAlign: TextAlign.center, style: theme.textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Help us improve FoodHub!', textAlign: TextAlign.center, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 32),
            TextField(decoration: const InputDecoration(hintText: 'Subject', border: OutlineInputBorder()),),
            const SizedBox(height: 16),
            TextField(decoration: const InputDecoration(hintText: 'Describe your experience...', alignLabelWithHint: true, border: OutlineInputBorder()), maxLines: 6,),
            const SizedBox(height: 16),
            Row(children: [Text('Rating:', style: theme.textTheme.bodyMedium), const Spacer(), Row(children: [for (int i = 1; i <= 5; i++) IconButton(icon: Icon(i <= 5 ? Icons.star : Icons.star_border, color: Colors.amber), onPressed: () {})],)]),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: () {}, child: const Text('Submit Feedback')),
          ],
        ),
      ),
    );
  }
}
