import 'package:food_hub/routes/routes.dart';
import 'package:flutter/material.dart';

class DeliveryAddressPage extends StatelessWidget {
  const DeliveryAddressPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delivery Address')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _addressCard(context, 'Home', '123 Main St, Apt 4B\nNew York, NY 10001', isDefault: true),
          _addressCard(context, 'Office', '456 Business Ave, Floor 12\nNew York, NY 10002', isDefault: false),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pushNamed(Routes.addNewAddress),
            icon: const Icon(Icons.add),
            label: const Text('Add New Address'),
          ),
        ],
      ),
    );
  }

  Widget _addressCard(BuildContext ctx, String title, String address,
      {bool isDefault = false}) {
    final theme = Theme.of(ctx);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
            child: Icon(isDefault ? Icons.home : Icons.work,
                color: theme.colorScheme.primary)),
        title: Row(
          children: [
            Text(title, style: theme.textTheme.titleMedium),
            if (isDefault) ...[
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8)),
                child: Text('Default',
                    style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 10,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ],
        ),
        subtitle: Text(address),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class AddNewAddressPage extends StatelessWidget {
  const AddNewAddressPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Address')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Address Name')),
            const SizedBox(height: 16),
            TextField(decoration: const InputDecoration(labelText: 'Street Address'), maxLines: 2),
            const SizedBox(height: 16),
            Row(children: [Expanded(child: TextField(decoration: const InputDecoration(labelText: 'City'))), const SizedBox(width: 16), Expanded(child: TextField(decoration: const InputDecoration(labelText: 'State/Province')))],),
            const SizedBox(height: 16),
            Row(children: [Expanded(child: TextField(decoration: const InputDecoration(labelText: 'Postal Code'))), const SizedBox(width: 16), Expanded(child: TextField(decoration: const InputDecoration(labelText: 'Country')))],),
            const SizedBox(height: 24),
            Row(children: [Checkbox(value: true, onChanged: (_) {}), const Text('Set as default address')],),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Save Address')),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(hintText: 'Search food or restaurant...', prefixIcon: Icon(Icons.search))),
            const SizedBox(height: 24),
            Align(alignment: Alignment.centerLeft, child: Text('Recent Searches', style: theme.textTheme.titleMedium)),
            const SizedBox(height: 8),
            Wrap(spacing: 8, children: ['Burger', 'Pizza', 'Sushi', 'Salad'].map((t) => FilterChip(label: Text(t), onSelected: (_) {})).toList()),
            const SizedBox(height: 24),
            Align(alignment: Alignment.centerLeft, child: Text('Popular Now', style: theme.textTheme.titleMedium)),
            const SizedBox(height: 8),
            ...['Margherita Pizza', 'Classic Burger', 'Caesar Salad'].map((item) => Card(margin: const EdgeInsets.only(bottom: 8), child: ListTile(leading: const Icon(Icons.fastfood), title: Text(item), trailing: const Icon(Icons.chevron_right), onTap: () => Navigator.of(context).pushNamed(Routes.foodDetails),))),
          ],
        ),
      ),
    );
  }
}
