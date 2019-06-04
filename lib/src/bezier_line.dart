import 'package:flutter/material.dart';

typedef MissingValueBuilder = double Function(DateTime value);

class BezierLine {
  final Color lineColor;
  final double lineStrokeWidth;
  final List<DataPoint> data;
  final MissingValueBuilder onMissingValue;
  final String label;

  const BezierLine({
    this.lineColor = Colors.white,
    this.lineStrokeWidth = 3.0,
    this.label = "",
    this.onMissingValue,
    this.data,
  });

  factory BezierLine.copy({BezierLine bezierLine}) {
    return BezierLine(
      lineColor: bezierLine.lineColor,
      lineStrokeWidth: bezierLine.lineStrokeWidth,
      label: bezierLine.label,
      onMissingValue: bezierLine.onMissingValue,
      data: bezierLine.data,
    );
  }
}

class DataPoint<T> {
  final double value;
  final T xAxis;

  const DataPoint({
    this.value,
    this.xAxis,
  });

  String toString() => "value: $value, xAxis: $xAxis";
}
