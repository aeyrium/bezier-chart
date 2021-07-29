import 'package:intl/intl.dart' as intl;
import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';

class Sample12 extends StatefulWidget {
  @override
  _Sample12State createState() => _Sample12State();
}

class _Sample12State extends State<Sample12> {
  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState() {
    super.initState();
    fromDate = DateTime(2019, 08, 1);
    toDate = DateTime.now();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final date1 = toDate.subtract(Duration(days: 2));
    final date2 = toDate.subtract(Duration(days: 3));
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic date range"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.today),
              onPressed: () {
                setState(() {
                  fromDate = DateTime(2019, 07, 20);
                });
              }),
          IconButton(
              icon: Icon(Icons.history),
              onPressed: () {
                setState(() {
                  fromDate = DateTime(2019, 08, 1);
                });
              }),
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.red,
          //height: MediaQuery.of(context).size.height / 2,
          //width: MediaQuery.of(context).size.width,
          child: BezierChart(
            fromDate: fromDate,
            bezierChartScale: BezierChartScale.WEEKLY,
            toDate: toDate,
            onIndicatorVisible: (val) {
              print("Indicator Visible :$val");
            },
            onDateTimeSelected: (datetime) {
              print("selected datetime: $datetime");
            },
            selectedDate: toDate,
            //this is optional
            footerDateTimeBuilder:
                (DateTime value, BezierChartScale? scaleType) {
              final newFormat = intl.DateFormat('dd/MMM');
              return newFormat.format(value);
            },
            bubbleLabelDateTimeBuilder:
                (DateTime value, BezierChartScale? scaleType) {
              final newFormat = intl.DateFormat('EEE d');
              return "${newFormat.format(value)}\n";
            },
            series: [
              BezierLine(
                label: "Duty",
                onMissingValue: (dateTime) {
                  return 44.5;
                },
                data: <DataPoint<DateTime>>[
                  DataPoint<DateTime>(
                      value: 45.5, xAxis: DateTime(2019, 7, 25)),
                  DataPoint<DateTime>(
                      value: 48.5, xAxis: DateTime(2019, 7, 30)),
                  DataPoint<DateTime>(value: 44.5, xAxis: fromDate),
                  DataPoint<DateTime>(value: 40, xAxis: date1),
                  DataPoint<DateTime>(value: 43.5, xAxis: date2),
                ],
              ),
            ],
            config: BezierChartConfig(
              displayDataPointWhenNoValue: false,
              verticalIndicatorStrokeWidth: 3.0,
              pinchZoom: false,
              verticalIndicatorColor: Colors.black26,
              showVerticalIndicator: true,
              verticalIndicatorFixedPosition: false,
              backgroundColor: Colors.red,
              displayYAxis: true,
              stepsYAxis: 1,
            ),
          ),
        ),
      ),
    );
  }
}
