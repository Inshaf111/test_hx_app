import 'package:flutter/material.dart';

class TimeFilterBar extends StatefulWidget {
  const TimeFilterBar({super.key});

  @override
  State<TimeFilterBar> createState() => _TimeFilterBarState();
}

class _TimeFilterBarState extends State<TimeFilterBar> {
  final List<String> filters = ['1D', '1W', '1M', '1Y', 'YTD', 'MAX'];
  String selected = '1M';

  final Color primaryGreen = const Color(0xFF003D2C); // Match chart color

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = filters[index] == selected;
          return GestureDetector(
            onTap: () {
              setState(() {
                selected = filters[index];
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              decoration: BoxDecoration(
                color: isSelected ? primaryGreen : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color:
                      isSelected ? primaryGreen : Colors.grey.withOpacity(0.3),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  filters[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.white : primaryGreen,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
