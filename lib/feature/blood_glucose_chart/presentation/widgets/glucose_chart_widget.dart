import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:glucose_reader/feature/domain/model/blood_glucose.dart';

class GlucoseChartWidget extends StatelessWidget {
  const GlucoseChartWidget({super.key, required this.glucoses});

  final List<BloodGlucose> glucoses;

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spots = glucoses.map((glucose) {
      double x = glucose.timestamp
          .difference(glucoses.first.timestamp)
          .inMinutes
          .toDouble();
      double y = glucose.value;
      return FlSpot(x, y);
    }).toList();

    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: Colors.blue,
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: true),
            belowBarData:
                BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
          )
        ],
      ),
    );
  }
}
