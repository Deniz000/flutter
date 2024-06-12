import 'package:demo_pages/dashboard/model/bar_graph_model.dart';
import 'package:demo_pages/dashboard/model/graph_model.dart';
import 'package:flutter/material.dart';

class BarGraphData {
  final data = [
    BarGraphModel("Aktivity Level", Colors.yellow, [
      GraphModel(0, 8),
      GraphModel(1, 10),
      GraphModel(2, 7),
      GraphModel(3, 4),
      GraphModel(4, 4),
      GraphModel(5, 6),
    ]),
    BarGraphModel("Nutrition", Colors.blue, [
      GraphModel(0, 8),
      GraphModel(1, 10),
      GraphModel(2, 7),
      GraphModel(3, 4),
      GraphModel(4, 4),
      GraphModel(5, 6),
    ]),
    BarGraphModel("Hydration Kevel", Colors.green, [
      GraphModel(0, 8),
      GraphModel(1, 10),
      GraphModel(2, 7),
      GraphModel(3, 4),
      GraphModel(4, 4),
      GraphModel(5, 6),
    ]),
  ];
}
