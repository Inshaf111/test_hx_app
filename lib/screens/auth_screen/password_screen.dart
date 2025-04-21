import 'package:flutter/material.dart';
import 'package:test_hx_app/screens/home_onboarding_screen/home_onboarding_screen.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _obscureText = true;

  // Validation flags
  bool hasMinLength = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;

  void _validatePassword(String value) {
    setState(() {
      hasMinLength = value.length >= 8 && value.length <= 16;
      hasNumber = RegExp(r'[0-9]').hasMatch(value);
      hasSpecialChar = RegExp(r'[!@#\\$&*~]').hasMatch(value);
      hasUpperCase = RegExp(r'[A-Z]').hasMatch(value);
      hasLowerCase = RegExp(r'[a-z]').hasMatch(value);
    });
  }

  Widget _buildRequirement(bool met, String text) {
    return Row(
      children: [
        Icon(
          met ? Icons.check_circle : Icons.radio_button_unchecked,
          color: met ? Colors.green : Colors.grey,
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(fontSize: 15)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F0EE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Set Password',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sentient'),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Create a strong password to secure your account.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                const Text('Password',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                TextField(
                  controller: _controller,
                  obscureText: _obscureText,
                  onChanged: _validatePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: Colors.white, // Background color
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                      onPressed: () =>
                          setState(() => _obscureText = !_obscureText),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text('Password Requirements:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                _buildRequirement(hasMinLength, '8–16 characters only'),
                const SizedBox(height: 10),
                _buildRequirement(hasNumber, 'At least 1 number'),
                const SizedBox(height: 10),
                _buildRequirement(
                    hasSpecialChar, 'At least 1 special character like !#@\$'),
                const SizedBox(height: 10),
                _buildRequirement(
                    hasUpperCase, 'At least 1 upper case character'),
                const SizedBox(height: 10),
                _buildRequirement(
                    hasLowerCase, 'At least 1 lower case character'),
                const SizedBox(height: 20),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.lock_outline, color: Colors.teal),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'We use bank-grade encryption and multi-layer protection to keep your financial data safe from day one.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            if (hasMinLength &&
                hasNumber &&
                hasSpecialChar &&
                hasUpperCase &&
                hasLowerCase) {
              // All conditions are met
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeOnboardingScreen(),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Please meet all password requirements.')),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF123B36),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            'Set Password',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
