
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'sensor_tani.dart';

class LineChartWidget extends StatelessWidget {
  final List<HumidityPoint> points;

  const LineChartWidget(this.points, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
              isCurved: false,
              dotData: FlDotData(
                show: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
