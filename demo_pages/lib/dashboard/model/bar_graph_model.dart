import 'package:demo_pages/dashboard/model/graph_model.dart';
import 'package:flutter/material.dart';

class BarGraphModel {
  final String label;
  final Color color;
  final List<GraphModel> graph;

  BarGraphModel(this.label, this.color, this.graph);
  
}
