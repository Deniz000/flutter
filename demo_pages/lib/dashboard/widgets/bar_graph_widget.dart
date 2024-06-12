import 'package:demo_pages/dashboard/const/constants.dart';
import 'package:demo_pages/dashboard/data/bar_graph_data.dart';
import 'package:demo_pages/dashboard/model/graph_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraphWidget extends StatelessWidget {
  const BarGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bardGraphData = BarGraphData().data;
    return GridView.builder(
      itemCount: bardGraphData.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 12,
          childAspectRatio: 5 / 4),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: selectionColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bardGraphData[index].label,
                style: const TextStyle(color: white),
              ),
              Expanded(
                  child: BarChart(BarChartData(
                      borderData: FlBorderData(border: Border.all(width: 0)),
                      barGroups: _chartGroups(
                          points: bardGraphData[index].graph,
                          color: bardGraphData[index].color),
                      gridData: const FlGridData(show: false),
                      titlesData: FlTitlesData(
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                bardGraphData[index].label[value.toInt()],
                                style: const TextStyle(color: white),
                              );
                            },
                          ))))))
            ],
          ),
        );
      },
    );
  }

  List<BarChartGroupData> _chartGroups({
    required List<GraphModel> points,
    required Color color,
  }) {
    return points
        .map((point) => BarChartGroupData(x: point.x.toInt(), barRods: [
              BarChartRodData(
                  toY: point.y,
                  width: 12,
                  borderRadius: const BorderRadius.all(Radius.circular(1)),
                  color: color.withOpacity(point.y.toInt() > 4 ? 1 : 0.4)),
            ]))
        .toList();
  }
}
