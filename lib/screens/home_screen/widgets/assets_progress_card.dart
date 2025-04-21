import 'package:flutter/material.dart';

class AssetsLiabilitiesCard extends StatelessWidget {
  final double assets;
  final double liabilities;

  const AssetsLiabilitiesCard({
    super.key,
    required this.assets,
    required this.liabilities,
  });

  @override
  Widget build(BuildContext context) {
    final double total = assets + liabilities;
    final double assetRatio = total == 0 ? 0 : assets / total;
    final Color green = const Color(0xFF067F42); // Match chart green

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row: Headings
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Assets', style: TextStyle(fontFamily: 'Sentient')),
                Text('Liabilities', style: TextStyle(fontFamily: 'Sentient')),
              ],
            ),
            const SizedBox(height: 12),

            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: assetRatio,
                minHeight: 7,
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(green),
              ),
            ),
            const SizedBox(height: 12),

            // Row: Values
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  assets.toStringAsFixed(0),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  liabilities.toStringAsFixed(0),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
