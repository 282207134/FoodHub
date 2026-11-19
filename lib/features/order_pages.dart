import 'package:food_hub/routes/routes.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Order Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(color: theme.colorScheme.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const Icon(Icons.local_shipping, color: Colors.orange, size: 18),
                  const SizedBox(width: 8),
                  Text('In Transit', style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.primary)),
                ]),
              ),
            ),
            const SizedBox(height: 24),
            ...[
              _step('Order Placed', '12:30 PM', true),
              _step('Confirmed', '12:35 PM', true),
              _step('Preparing', '12:40 PM', true),
              _step('On the Way', '1:00 PM', true),
              _step('Delivered', 'Estimated 1:30 PM', false),
            ],
            const Divider(height: 32),
            Text('Order Items', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            _orderItem('Margherita Pizza x2', r'\$17.98'),
            _orderItem('Garlic Bread x1', r'\$4.99'),
            _orderItem('Coca-Cola x2', r'\$3.98'),
            const Divider(height: 16),
            _summaryRow('Subtotal', r'\$26.95'),
            _summaryRow('Delivery', r'\$2.99'),
            _summaryRow('Total', r'\$29.94', isTotal: true),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pushNamed(Routes.mapOrderTracking),
              icon: const Icon(Icons.map),
              label: const Text('Track on Map'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _step(String step, String time, bool completed) {
    return Row(
      children: [
        Icon(completed ? Icons.check_circle : Icons.radio_button_unchecked, color: completed ? Colors.green : Colors.grey),
        const SizedBox(width: 12),
        Expanded(child: Text(step, style: const TextStyle(fontWeight: FontWeight.w500))),
        Text(time, style: Theme.of(_stepContext!).textTheme.bodySmall),
      ],
    );
  }

  // Helper to access context in private widgets
  BuildContext? get _stepContext => null;

  Widget _orderItem(String name, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(name), Text(price, style: Theme.of(_orderItemCtx!).textTheme.bodyMedium)],
    );
  }

  BuildContext? get _orderItemCtx => null;

  Widget _summaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: isTotal ? Theme.of(_summaryCtx!).textTheme.titleLarge : Theme.of(_summaryCtx!).textTheme.bodyMedium),
        Text(value, style: isTotal ? Theme.of(_summaryCtx!).textTheme.titleLarge?.copyWith(color: Theme.of(_summaryCtx!).colorScheme.primary, fontWeight: FontWeight.bold) : Theme.of(_summaryCtx!).textTheme.bodyMedium),
      ],
    );
  }

  BuildContext? get _summaryCtx => null;
}

// Fix: pass context properly
class OrderDetailsPageFixed extends StatefulWidget {
  const OrderDetailsPageFixed({super.key});
  @override
  State<OrderDetailsPageFixed> createState() => _OrderDetailsPageFixedState();
}

class _OrderDetailsPageFixedState extends State<OrderDetailsPageFixed> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Order Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(color: theme.colorScheme.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const Icon(Icons.local_shipping, color: Colors.orange, size: 18),
                  const SizedBox(width: 8),
                  Text('In Transit', style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.primary)),
                ]),
              ),
            ),
            const SizedBox(height: 24),
            _buildStep(context, 'Order Placed', '12:30 PM', true),
            _buildStep(context, 'Confirmed', '12:35 PM', true),
            _buildStep(context, 'Preparing', '12:40 PM', true),
            _buildStep(context, 'On the Way', '1:00 PM', true),
            _buildStep(context, 'Delivered', 'Estimated 1:30 PM', false),
            const Divider(height: 32),
            Text('Order Items', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            _buildOrderItem(context, 'Margherita Pizza x2', r'\$17.98'),
            _buildOrderItem(context, 'Garlic Bread x1', r'\$4.99'),
            _buildOrderItem(context, 'Coca-Cola x2', r'\$3.98'),
            const Divider(height: 16),
            _buildSummaryRow(context, 'Subtotal', r'\$26.95'),
            _buildSummaryRow(context, 'Delivery', r'\$2.99'),
            _buildSummaryRow(context, 'Total', r'\$29.94', isTotal: true),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pushNamed(Routes.mapOrderTracking),
              icon: const Icon(Icons.map),
              label: const Text('Track on Map'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(BuildContext ctx, String step, String time, bool completed) {
    return Row(
      children: [
        Icon(completed ? Icons.check_circle : Icons.radio_button_unchecked, color: completed ? Colors.green : Colors.grey),
        const SizedBox(width: 12),
        Expanded(child: Text(step, style: const TextStyle(fontWeight: FontWeight.w500))),
        Text(time, style: Theme.of(ctx).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildOrderItem(BuildContext ctx, String name, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(name), Text(price, style: Theme.of(ctx).textTheme.bodyMedium)],
    );
  }

  Widget _buildSummaryRow(BuildContext ctx, String label, String value, {bool isTotal = false}) {
    final t = Theme.of(ctx);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: isTotal ? t.textTheme.titleLarge : t.textTheme.bodyMedium),
        Text(value, style: isTotal ? t.textTheme.titleLarge?.copyWith(color: t.colorScheme.primary, fontWeight: FontWeight.bold) : t.textTheme.bodyMedium),
      ],
    );
  }
}

class MyOrderEmptyPage extends StatelessWidget {
  const MyOrderEmptyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('No Orders Yet')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt_long, size: 100, color: Theme.of(context).colorScheme.primary.withOpacity(0.3)),
            const SizedBox(height: 24),
            Text('No orders yet', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Start ordering delicious food!', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: () => Navigator.of(context).pushNamed(Routes.homeScreen), child: const Text('Browse Restaurants')),
          ],
        ),
      ),
    );
  }
}

class MyOrdersHistoryPage extends StatelessWidget {
  const MyOrdersHistoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Order History')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 8,
        itemBuilder: (context, i) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Container(width: 48, height: 48, color: theme.dividerColor, child: const Icon(Icons.receipt)),
              title: Text('Order #${2024000 + i}', style: theme.textTheme.titleMedium),
              subtitle: Text('Pizza Hut · \$${(i + 5) * 3}.99 · Completed', style: theme.textTheme.bodySmall),
              trailing: ElevatedButton(onPressed: () => Navigator.of(context).pushNamed(Routes.orderDetails), child: const Text('Reorder')),
            ),
          );
        },
      ),
    );
  }
}

class MyOrdersUpcomingPage extends StatelessWidget {
  const MyOrdersUpcomingPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Upcoming Orders')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (context, i) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Container(width: 48, height: 48, color: theme.colorScheme.primary.withOpacity(0.1), child: Icon(Icons.pending, color: theme.colorScheme.primary)),
              title: Text('Order #${1000 + i}', style: theme.textTheme.titleMedium),
              subtitle: Text(['Preparing...', 'On the way', 'Confirmed'][i]!),
              trailing: IconButton(icon: const Icon(Icons.track_changes), onPressed: () => Navigator.of(context).pushNamed(Routes.mapOrderTracking)),
              onTap: () => Navigator.of(context).pushNamed(Routes.orderDetails),
            ),
          );
        },
      ),
    );
  }
}
