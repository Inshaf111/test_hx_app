import 'package:flutter/material.dart';
import 'package:test_hx_app/screens/home_screen/widgets/section_card.dart';

class LiabilitiesSection extends StatelessWidget {
  const LiabilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SectionCard(
        title: "Liabilities",
        child: ListTile(
          title:
              Text("You currently have no liabilities added to your profile."),
          trailing: Icon(
            Icons.chevron_right,
            size: 30,
          ),
        ),
      ),
    );
  }
}
