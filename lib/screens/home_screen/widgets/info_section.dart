import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
              child: _infoCard(
                  icon: Icons.phone,
                  title: "Services",
                  desc:
                      "Speak with an expert to receive help in achieving your goals")),
          const SizedBox(width: 16),
          Expanded(
              child: _infoCard(
                  icon: Icons.lock,
                  title: "Vault",
                  desc:
                      "Store your documents securely, only you can access them")),
        ],
      ),
    );
  }

  Widget _infoCard(
      {required IconData icon, required String title, required String desc}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFD5F1EE),
              child: Icon(icon, color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Sentient')),
            const SizedBox(height: 4),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
