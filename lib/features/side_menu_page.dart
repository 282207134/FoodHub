import 'package:flutter/material.dart';

class SideMenuPage extends StatelessWidget {
  const SideMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        color: theme.scaffoldBackgroundColor,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(radius: 32, backgroundColor: theme.colorScheme.primary.withOpacity(0.2), child: const Icon(Icons.person, size: 32)),
                IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
              ],
            ),
            const SizedBox(height: 24),
            Text('Welcome, User', style: theme.textTheme.titleLarge),
            const SizedBox(height: 4),
            Text('user@foodhub.com', style: theme.textTheme.bodySmall),
            const Divider(height: 32),
            _menuItem(context, Icons.home, 'Home'),
            _menuItem(context, Icons.map, 'Map View'),
            _menuItem(context, Icons.receipt_long, 'My Orders'),
            _menuItem(context, Icons.favorite, 'Favorites'),
            _menuItem(context, Icons.location_on, 'Delivery Address'),
            _menuItem(context, Icons.payment, 'Payment Methods'),
            _menuItem(context, Icons.settings, 'Settings'),
            _menuItem(context, Icons.help, 'Help Center'),
            const Spacer(),
            const Divider(height: 16),
            _menuItem(context, Icons.logout, 'Log Out', isDestructive: true),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(BuildContext ctx, IconData icon, String label, {bool isDestructive = false}) {
    final theme = Theme.of(ctx);
    return ListTile(
      leading: Icon(icon, color: isDestructive ? theme.colorScheme.error : null),
      title: Text(label, style: TextStyle(color: isDestructive ? theme.colorScheme.error : null)),
      onTap: () => Navigator.of(ctx).pop(),
    );
  }
}
