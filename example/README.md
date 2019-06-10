# example

A sample using Bezier Chart with Numbers

```dart


import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bezier Chart - Numbers"),
      ),
      body: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.black54,
          Colors.black87,
          Colors.black87,
          Colors.black,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Bezier Chart - Numbers",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        Center(
          child: Card(
            elevation: 12,
            clipBehavior: Clip.hardEdge,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width * 0.9,
              child: BezierChart(
                bezierChartScale: BezierChartScale.CUSTOM,
                xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
                footerValueBuilder: (double value) {
                  return "${intOrDouble(value)}\ndays";
                },
                series: const [
                  BezierLine(
                    label: "m",
                    data: const [
                      DataPoint<double>(value: 10, xAxis: 0),
                      DataPoint<double>(value: 130, xAxis: 5),
                      DataPoint<double>(value: 50, xAxis: 10),
                      DataPoint<double>(value: 150, xAxis: 15),
                      DataPoint<double>(value: 75, xAxis: 20),
                      DataPoint<double>(value: 0, xAxis: 25),
                      DataPoint<double>(value: 5, xAxis: 30),
                      DataPoint<double>(value: 45, xAxis: 35),
                    ],
                  ),
                ],
                config: BezierChartConfig(
                  footerHeight: 40,
                  verticalIndicatorStrokeWidth: 3.0,
                  verticalIndicatorColor: Colors.black26,
                  showVerticalIndicator: true,
                  verticalIndicatorFixedPosition: false,
                  backgroundGradient: LinearGradient(
                    colors: [
                      Colors.red[300],
                      Colors.red[400],
                      Colors.red[400],
                      Colors.red[500],
                      Colors.red,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  snap: false,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ),

    );
  }
}

```

<p align="center">
  <img src="https://media.giphy.com/media/lorQ1rqP0CABf4t4TY/giphy.gif">
</p>