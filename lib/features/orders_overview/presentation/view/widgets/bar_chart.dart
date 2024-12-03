import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/responsive.dart';

class OrdersBarChart extends StatelessWidget {
  const OrdersBarChart({super.key, required this.xLabels, required this.yValues});

  final List<String> xLabels;
  final List<double> yValues;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: BarChart(
          BarChartData(
            maxY: 20,
            barGroups: _generateBarGroups(),
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              leftTitles: AxisTitles(
                axisNameWidget: Text(
                  "Orders Count",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 2,
                  getTitlesWidget: (value, meta) => Text(
                    value.toInt().toString(),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    final label = xLabels[value.toInt()];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Transform.rotate(
                        angle: Responsive.isMobile(context) ? 0.4: 0,
                        child: Text(
                          label,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            gridData: const FlGridData(show: true),
            borderData: FlBorderData(
              show: true,
              border: const Border(
                bottom: BorderSide(width: 1),
                left: BorderSide( width: 1),
              ),
            ),

          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _generateBarGroups() {
    return List.generate(
      yValues.length,
          (index) {
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(2),
              toY: yValues[index],
              width: 12,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF1A73E8), // Dark blue
                  Color(0xFF34A853), // Green
                  Color(0xFFFBBC05), // Orange
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ],
          showingTooltipIndicators: [],
        );
      },
    );
  }
}
