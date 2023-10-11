import 'dart:convert';
import 'package:flutter/widgets.dart';

class HumidityPoint {
  final double x;
  final double y;

  HumidityPoint({required this.x, required this.y});
}

Future<List<HumidityPoint>> getPoints(context) async {
  String data = await DefaultAssetBundle.of(context).loadString("assets/soil_hum.json");
  final soilHumArray = jsonDecode(data);
  List<HumidityPoint> out = [];
  int i = 1;
  for (double elem in soilHumArray) {
    var point = HumidityPoint(x: i.toDouble(), y: elem);
    out.add(point);
    i++;
  }

  return out;
}
