import 'package:flutter/material.dart';

import 'feature_card.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FeatureCard(
          icon: Icons.show_chart,
          title: "Forecast Your Financial Future with WealthFlow",
          description:
              "See how your wealth could grow over time. WealthFlow helps you forecast future projections based on your assets, growth assumptions, and inflation trends.",
          buttonText: "Create Wealth Forecast",
        ),
        SizedBox(height: 16),
        FeatureCard(
          icon: Icons.remove_red_eye,
          title: "Your Watchlist",
          description:
              "Track stocks, ETFs, crypto, and currencies—all in one place. Stay updated with market shifts",
          buttonText: "Start Tracking",
        ),
      ],
    );
  }
}
