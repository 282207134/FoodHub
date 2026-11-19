import 'package:food_hub/routes/routes.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Order Total', style: theme.textTheme.bodyMedium),
            Text('\$32.96', style: theme.textTheme.headlineMedium?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
            const Divider(height: 32),
            Text('Payment Method', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            _paymentMethod(context, 'Credit Card', '•••• •••• •••• 4242', Icons.credit_card, isSelected: true),
            _paymentMethod(context, 'PayPal', 'user@email.com', Icons.payments),
            _paymentMethod(context, 'Apple Pay', '', Icons.apple),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () => Navigator.of(context).pushNamed(Routes.addNewCard),
              icon: const Icon(Icons.add),
              label: const Text('Add New Card'),
            ),
            const SizedBox(height: 24),
            Text('Delivery Address', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.red),
                title: const Text('Home'),
                subtitle: const Text('123 Main St, Apt 4B, New York, NY 10001'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).pushNamed(Routes.deliveryAddress),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(Routes.orderDetails),
              child: const Text('Place Order - \$32.96'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentMethod(BuildContext ctx, String name, String detail, IconData icon, {bool isSelected = false}) {
    final theme = Theme.of(ctx);
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? theme.colorScheme.primary : theme.dividerColor),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? theme.colorScheme.primary.withOpacity(0.05) : null,
        ),
        child: Row(
          children: [
            Icon(icon, size: 32, color: isSelected ? theme.colorScheme.primary : Colors.grey),
            const SizedBox(width: 16),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(name, style: theme.textTheme.titleMedium),
              Text(detail, style: theme.textTheme.bodySmall),
            ])),
            if (isSelected) const Icon(Icons.check_circle, color: Colors.green),
          ],
        ),
      ),
    );
  }
}

class AddNewCardPage extends StatelessWidget {
  const AddNewCardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Card')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Card Number')),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: TextField(decoration: const InputDecoration(labelText: 'Expiry Date'))),
                const SizedBox(width: 16),
                Expanded(child: TextField(decoration: const InputDecoration(labelText: 'CVV'))),
              ],
            ),
            const SizedBox(height: 16),
            TextField(decoration: const InputDecoration(labelText: 'Cardholder Name')),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Save Card')),
          ],
        ),
      ),
    );
  }
}

class ScanCardPage extends StatelessWidget {
  const ScanCardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Card')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt, size: 120, color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
            const SizedBox(height: 24),
            Text('Point camera at card to scan', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('Or enter manually', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Enter Manually')),
          ],
        ),
      ),
    );
  }
}
