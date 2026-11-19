import 'package:flutter/material.dart';

class CancelNowPage extends StatelessWidget {
  const CancelNowPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cancel Order')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 2),
            Icon(Icons.warning_amber_rounded, size: 100, color: theme.colorScheme.error.withOpacity(0.5)),
            const SizedBox(height: 24),
            Text('Are you sure you want to cancel?', textAlign: TextAlign.center, style: theme.textTheme.headlineSmall),
            const SizedBox(height: 16),
            Text('This action cannot be undone.', textAlign: TextAlign.center, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 32),
            OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Keep Order')),
            const SizedBox(height: 16),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.error), onPressed: () {}, child: const Text('Confirm Cancellation')),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
