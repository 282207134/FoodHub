import 'package:food_hub/routes/routes.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Icon(Icons.person_add, size: 64, color: Theme.of(context).colorScheme.primary.withOpacity(0.6)),
            const SizedBox(height: 24),
            TextField(decoration: const InputDecoration(labelText: 'Full Name')),
            const SizedBox(height: 16),
            TextField(decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 16),
            TextField(decoration: const InputDecoration(labelText: 'Phone Number')),
            const SizedBox(height: 16),
            TextField(obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 16),
            TextField(obscureText: true, decoration: const InputDecoration(labelText: 'Confirm Password')),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(Routes.verification),
              child: const Text('Create Account'),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Already have an account? Log In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verification'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 2),
            Icon(Icons.sms, size: 80, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 24),
            Text('Enter verification code', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('We sent a code to +1 234 567 8900', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (i) => _CodeBox(i == 0 ? AxisDirection.down : AxisDirection.up)),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.homeScreen), child: const Text('Verify')),
            const SizedBox(height: 16),
            Center(child: TextButton(onPressed: () {}, child: const Text('Resend Code'))),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _CodeBox extends StatelessWidget {
  final AxisDirection dir;
  const _CodeBox(this.dir);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56, height: 64,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Theme.of(context).dividerColor)),
      child: Icon(Icons.arrow_upward, color: Theme.of(context).colorScheme.primary),
    );
  }
}

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 2),
            Icon(Icons.lock_reset, size: 80, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 24),
            Text('Reset Password', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Enter your new password below', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 32),
            TextField(obscureText: true, decoration: const InputDecoration(labelText: 'New Password')),
            const SizedBox(height: 16),
            TextField(obscureText: true, decoration: const InputDecoration(labelText: 'Confirm New Password')),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Reset Password')),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class PhoneRegistrationPage extends StatelessWidget {
  const PhoneRegistrationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Registration'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 2),
            Icon(Icons.phone_android, size: 80, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 24),
            Text('Register with Phone', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Enter your phone number to receive a verification code', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 32),
            Row(
              children: [
                Flexible(flex: 2, child: InputDecorator(decoration: const InputDecoration(labelText: '+1')),),
                const SizedBox(width: 12),
                Expanded(child: TextField(decoration: const InputDecoration(hintText: 'Phone Number'))),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () => Navigator.of(context).pushNamed(Routes.verification), child: const Text('Send Code')),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
