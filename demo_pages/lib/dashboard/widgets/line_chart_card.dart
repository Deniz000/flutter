import 'package:demo_pages/dashboard/const/constants.dart';
import 'package:demo_pages/dashboard/data/line_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = LineData();
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
      color: selectionColor.withOpacity(0.3),
      borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            "Steps Overview",
            style: TextStyle(color: white, fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          AspectRatio(
              aspectRatio: 15 / 5,
              child: LineChart(
                LineChartData(
                    lineTouchData: const LineTouchData(
                      handleBuiltInTouches: true,
                    ),
                    gridData: const FlGridData(show: false),
                    titlesData: FlTitlesData(
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            return data.bottomTitle[value.toInt()] != null
                                ? SideTitleWidget(
                                    axisSide: meta.axisSide,
                                    child: Text(data.bottomTitle[value.toInt()].toString(),
                                      style: const TextStyle(color: white),
                                    ))
                                : Container(
                                    color: Colors.red,
                                  );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return data.leftTitle[value.toInt()] != null
                                  ? SideTitleWidget(
                                      axisSide: meta.axisSide,
                                      child: Text(
                                        data.leftTitle[value.toInt()].toString(),
                                        style: const TextStyle(color: white),
                                      ))
                                  : const SizedBox();
                            },
                            interval: 1,
                            reservedSize: 40),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        color: selectionColor,
                        barWidth: 2,
                        belowBarData: BarAreaData(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
                              colors: [
                              secondary.withOpacity(0.4),
                              Colors.transparent
                            ]),
                            show: true),
                        dotData: const FlDotData(show: false),
                        spots: data.spots,
                      )
                    ],
                    minX: 0,
                    maxX: 120,
                    minY: -5,
                    maxY: 105,
                    
                    ),
                    
              ),)
        ],
      ),
    );
  }
}
