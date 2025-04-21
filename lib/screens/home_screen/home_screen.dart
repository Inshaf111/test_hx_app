import 'package:flutter/material.dart';
import 'package:test_hx_app/screens/home_screen/widgets/area_line_chart.dart';
import 'package:test_hx_app/screens/home_screen/widgets/header.dart';
import 'package:test_hx_app/screens/home_screen/widgets/liabilities_section.dart';
import 'package:test_hx_app/screens/home_screen/widgets/news_slider.dart';

import 'widgets/assets_progress_card.dart';
import 'widgets/assets_section.dart';
import 'widgets/features_section.dart';
import 'widgets/info_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xfffD7E5E3),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                Header(),
                SizedBox(height: 20),
                AreaLineChart(),
                SizedBox(height: 20),
                AssetsLiabilitiesCard(
                  assets: 500000,
                  liabilities: 00,
                ),
                SizedBox(height: 20),
                AssetSection(),
                SizedBox(height: 20),
                LiabilitiesSection(),
                SizedBox(height: 20),
                FeaturesSection(),
                SizedBox(height: 20),
                InfoSection(),
                SizedBox(height: 20),
                NewsSliderCard(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
