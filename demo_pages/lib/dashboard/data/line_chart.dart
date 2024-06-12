import 'package:fl_chart/fl_chart.dart';

class LineData {
  final spots = const [
    FlSpot(1.68, -5.04),
    FlSpot(5.34, 8.89),
    FlSpot(8.50, 18.17),
    FlSpot(10.10, 10.45),
    FlSpot(18.75, 22.15),
    FlSpot(25.80, 43.60),
    FlSpot(33.30, 30.45),
    FlSpot(39.70, 56.80),
    FlSpot(47.40, 89.30),
    FlSpot(54.85, 76.50),
    FlSpot(66.95, 80.20),
    FlSpot(73.60, 62.70),
    FlSpot(79.25, 98.90),
    FlSpot(90.10, 47.80),
    FlSpot(97.60, 56.20),
    FlSpot(108.30, 77.95),
    FlSpot(119.75, 30.60),
  ];

  final leftTitle = {
    0: '0',
    20: '2k',
    40: '4k',
    60: '6k',
    80: '8k',
    100: '10k',
  };
  final bottomTitle = {
    0: 'Jan',
    10: 'Feb',
    20: 'Mar',
    30: 'Apr',
    40: 'May',
    50: 'Jun',
    60: 'Jul',
    70: 'Aug',
    80: 'Sep',
    90: 'Oct',
    100: 'Nov',
    115: 'Dec',
  };
}
