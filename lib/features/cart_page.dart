import 'package:food_hub/routes/routes.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State<CartPage> createState() => _CartState();
}

class _CartState extends State<CartPage> {
  static final List<Map<String, dynamic>> items = [
    {'name': 'Margherita Pizza', 'price': 8.99, 'qty': 1},
    {'name': 'Garlic Bread', 'price': 4.99, 'qty': 2},
    {'name': 'Coca-Cola', 'price': 1.99, 'qty': 1},
  ];

  double get subtotal =>
      items.fold(0.0, (sum, item) => sum + (item['price'] as double) * (item['qty'] as int));
  double get delivery => 2.99;
  double get total => subtotal + delivery;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, i) {
                final item = items[i];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(
                        width: 64, height: 64, color: theme.dividerColor,
                        child: const Icon(Icons.fastfood)),
                    title: Text(item['name'] as String,
                        style: theme.textTheme.titleMedium),
                    subtitle: Text('\$${(item['price'] as double).toStringAsFixed(2)} each',
                        style: theme.textTheme.bodySmall),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: const Icon(Icons.remove_circle_outline), onPressed: () {}),
                        Text('${item['qty']}', style: theme.textTheme.titleMedium),
                        IconButton(icon: const Icon(Icons.add_circle_outline), onPressed: () {}),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          _CartSummary(subtotal: subtotal, delivery: delivery, total: total, theme: theme),
        ],
      ),
    );
  }
}

class _CartSummary extends StatelessWidget {
  final double subtotal;
  final double delivery;
  final double total;
  final ThemeData theme;
  const _CartSummary({required this.subtotal, required this.delivery, required this.total, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: theme.cardColor, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
      child: Column(
        children: [
          _row('Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
          const SizedBox(height: 8),
          _row('Delivery Fee', '\$${delivery.toStringAsFixed(2)}'),
          const Divider(height: 16),
          _row('Total', '\$${total.toStringAsFixed(2)}', isTotal: true),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed(Routes.payment),
            child: const Text('Proceed to Checkout'),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: isTotal ? theme.textTheme.titleLarge : theme.textTheme.bodyMedium),
        Text(value, style: isTotal ? theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold) : theme.textTheme.titleMedium),
      ],
    );
  }
}
