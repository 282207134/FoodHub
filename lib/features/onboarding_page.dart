import 'package:food_hub/routes/routes.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.delivery_dining, size: 120, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 32),
              Text(
                'Delicious Food,\n Delivered Fast',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(
                'Choose from hundreds of restaurants and get your food delivered to your doorstep in minutes.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).textTheme.bodySmall?.color),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.welcome),
                child: const Text('Get Started'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.homeScreen),
                child: const Text('Skip'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
