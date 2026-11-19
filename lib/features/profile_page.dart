import 'package:food_hub/routes/routes.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: 100, height: 100,
              decoration: BoxDecoration(color: theme.dividerColor, shape: BoxShape.circle),
              child: const Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 12),
            Text('John Doe', style: theme.textTheme.titleLarge),
            Text('john@example.com', style: theme.textTheme.bodySmall),
            const SizedBox(height: 24),
            _ProfileItem(Icons.receipt_long, 'My Orders', Routes.myOrdersHistory),
            _ProfileItem(Icons.favorite, 'Favorites', Routes.favoritesFoodItems),
            _ProfileItem(Icons.location_on, 'Delivery Address', Routes.deliveryAddress),
            _ProfileItem(Icons.payment, 'Payment Methods', Routes.payment),
            _ProfileItem(Icons.map, 'Map View', Routes.mapView),
            _ProfileItem(Icons.settings, 'Settings', null),
            _ProfileItem(Icons.help, 'Help Center', null),
            SwitchListTile(
              title: const Text('Dark Mode'),
              subtitle: Text(_isDark ? 'Enabled' : 'Disabled', style: theme.textTheme.bodySmall),
              value: _isDark,
              onChanged: (v) => setState(() => _isDark = v),
            ),
            const Divider(height: 32),
            OutlinedButton(onPressed: () {}, child: const Text('Log Out')),
          ],
        ),
      ),
    );
  }

  Widget _ProfileItem(IconData icon, String label, String? route) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(label, style: theme.textTheme.titleMedium),
        trailing: const Icon(Icons.chevron_right),
        onTap: route != null ? () => Navigator.of(context).pushNamed(route) : null,
      ),
    );
  }
}
