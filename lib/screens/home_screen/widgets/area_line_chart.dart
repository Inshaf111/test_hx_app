import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:test_hx_app/screens/home_screen/widgets/time_filter_bar.dart';

class AreaLineChart extends StatelessWidget {
  const AreaLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.6,
            child: LineChart(
              LineChartData(
                // backgroundColor: // Light bluish background
                minX: 11,
                maxX: 17,
                minY: 25000,
                maxY: 150000,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 25000,
                      reservedSize: 45,
                      getTitlesWidget: (value, meta) {
                        return Text('${(value ~/ 1000)}K',
                            style: const TextStyle(fontSize: 12));
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(value.toInt().toString(),
                            style: const TextStyle(fontSize: 12));
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 25000,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.withOpacity(0.2),
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    curveSmoothness: 0.3,
                    color: const Color(0xFF003D2C), // Dark green line
                    barWidth: 4,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF003D2C).withOpacity(0.3),
                          const Color(0xFF003D2C).withOpacity(0.05),
                        ],
                      ),
                    ),
                    dotData: const FlDotData(show: false),
                    spots: const [
                      FlSpot(11, 25000),
                      FlSpot(12, 105000),
                      FlSpot(13, 95000),
                      FlSpot(14, 95000),
                      FlSpot(15, 120000),
                      FlSpot(16, 118000),
                      FlSpot(17, 150000),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const TimeFilterBar()
        ],
      ),
    );
  }
}
