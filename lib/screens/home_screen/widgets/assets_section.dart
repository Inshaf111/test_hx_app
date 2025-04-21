import 'package:flutter/material.dart';

class AssetSection extends StatelessWidget {
  const AssetSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: _sectionCard(
        title: "Assets",
        child: Column(
          children: [
            _assetTile("Cash Accounts", "USD 0.00", Icons.account_balance,
                showAdd: true),
            _assetTile("Investments", "USD 4,000,000.00", Icons.pie_chart),
            _assetTile("Pensions", "USD 4,000,000.00", Icons.savings),
            _assetTile(
              "Properties",
              "USD 0.00",
              Icons.home,
            ),
          ],
        ),
      ),
    );
  }

  Widget _assetTile(String label, String value, IconData icon,
      {bool showAdd = false}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFD5F1EE),
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(label,
          style: const TextStyle(color: Colors.grey, fontFamily: 'Sentient')),
      subtitle:
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: showAdd
          ? ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF113832),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            )
          : const Icon(
              Icons.chevron_right,
              size: 30,
            ),
    );
  }

  Widget _sectionCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'Sentient')),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Color(0xFF003D2C),
                    size: 30,
                  )),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
