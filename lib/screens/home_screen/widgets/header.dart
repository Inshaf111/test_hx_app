import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Net Worth ',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Sentient',
                    color: Color(0xFFF4E5357)),
              ),
              SizedBox(height: 2),
              Text(
                'USD 100,000',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_upward,
                    size: 14,
                    color: Color(0xFF067F42),
                  ),
                  Text(
                    'USD 50,000(23.22%)',
                    style: TextStyle(fontSize: 14, color: Color(0xFF067F42)),
                  ),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.notifications_none_outlined,
                size: 30,
                color: Color(0xFF003D2C),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.menu,
                size: 30,
                color: Color(0xFF003D2C),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
