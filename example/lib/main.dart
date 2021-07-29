import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'sample10.dart';
import 'sample12.dart';
import 'sample13.dart';
import 'sample14.dart';

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
  _onTap(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(),
          body: widget,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bezier Chart Sample"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text("Sample 1"),
              subtitle: Text("Number Chart"),
              onTap: () => _onTap(
                context,
                sample1(context),
              ),
            ),
            ListTile(
              title: Text("Sample 2"),
              subtitle: Text("Number Chart/ multi curves"),
              onTap: () => _onTap(
                context,
                sample2(context),
              ),
            ),
            ListTile(
              title: Text("Sample 3"),
              subtitle: Text("Weekly Chart"),
              onTap: () => _onTap(
                context,
                sample3(context),
              ),
            ),
            ListTile(
              title: Text("Sample 4"),
              subtitle: Text("Montly Chart"),
              onTap: () => _onTap(
                context,
                sample4(context),
              ),
            ),
            ListTile(
              title: Text("Sample 5"),
              subtitle: Text("Yearly Chart"),
              onTap: () => _onTap(
                context,
                sample5(context),
              ),
            ),
            ListTile(
              title: Text("Sample 6"),
              subtitle: Text("Main Chart"),
              onTap: () => _onTap(
                context,
                sample6(context),
              ),
            ),
            ListTile(
              title: Text("Sample 7"),
              subtitle: Text("Custom Chart - Number"),
              onTap: () => _onTap(
                context,
                sample7(context),
              ),
            ),
            ListTile(
              title: Text("Sample 8"),
              subtitle: Text("Hourly Chart"),
              onTap: () => _onTap(
                context,
                sample8(context),
              ),
            ),
            ListTile(
              title: Text("Sample 9"),
              subtitle: Text("BezierChartScale.WEEKLY same day"),
              onTap: () => _onTap(
                context,
                sample9(context),
              ),
            ),
            ListTile(
              title: Text("Sample 10"),
              subtitle: Text("Async Custom Chart - Number"),
              onTap: () => _onTap(
                context,
                Sample10(),
              ),
            ),
            ListTile(
              title: Text("Sample 11"),
              subtitle: Text("Custom Bubble Label Example"),
              onTap: () => _onTap(
                context,
                sample11(context),
              ),
            ),
            ListTile(
              title: Text("Sample 12"),
              subtitle: Text("Dynamic date range"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Sample12())),
            ),
            ListTile(
              title: Text("Sample 13"),
              subtitle: Text("Dynamic date range"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Sample13())),
            ),
            ListTile(
              title: Text("Sample 14"),
              subtitle: Text(
                  "Sample with updatePositionOnTap & format indicator value"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Sample14())),
            ),
          ],
        ),
      ),
    );
  }
}

//SAMPLE CUSTOM VALUES
Widget sample1(BuildContext context) {
  return Container(
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
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width * 0.9,
              child: BezierChart(
                bezierChartScale: BezierChartScale.CUSTOM,
                selectedValue: 30,
                xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
                footerValueBuilder: (double value) {
                  return "${formatAsIntOrDouble(value)}\ndays";
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
                  startYAxisFromNonZeroValue: false,
                  bubbleIndicatorColor: Colors.white.withOpacity(0.9),
                  footerHeight: 40,
                  verticalIndicatorStrokeWidth: 3.0,
                  verticalIndicatorColor: Colors.black26,
                  showVerticalIndicator: true,
                  verticalIndicatorFixedPosition: false,
                  displayYAxis: true,
                  stepsYAxis: 10,
                  backgroundGradient: LinearGradient(
                    colors: [
                      Colors.red[300]!,
                      Colors.red[400]!,
                      Colors.red[400]!,
                      Colors.red[500]!,
                      Colors.red,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  snap: true,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget sample2(BuildContext context) {
  return Container(
    color: Colors.black87,
    child: Center(
      child: Card(
        elevation: 20,
        margin: EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: BezierChart(
            bezierChartScale: BezierChartScale.CUSTOM,
            xAxisCustomValues: const [0, 3, 10, 15, 20, 25, 30, 35],
            footerValueBuilder: (double value) {
              return "${value.toInt()}\nHrs";
            },
            series: const [
              BezierLine(
                label: "Custom 1",
                lineStrokeWidth: 4.0,
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
              BezierLine(
                lineColor: Colors.blue,
                lineStrokeWidth: 4.0,
                label: "Custom 2",
                data: const [
                  DataPoint<double>(value: 5, xAxis: 0),
                  DataPoint<double>(value: 50, xAxis: 5),
                  DataPoint<double>(value: 30, xAxis: 10),
                  DataPoint<double>(value: 30, xAxis: 15),
                  DataPoint<double>(value: 50, xAxis: 20),
                  DataPoint<double>(value: 40, xAxis: 25),
                  DataPoint<double>(value: 10, xAxis: 30),
                  DataPoint<double>(value: 30, xAxis: 35),
                ],
              ),
              BezierLine(
                lineColor: Colors.red,
                lineStrokeWidth: 4.0,
                label: "Custom 3",
                data: const [
                  DataPoint<double>(value: 5, xAxis: 0),
                  DataPoint<double>(value: 10, xAxis: 5),
                  DataPoint<double>(value: 35, xAxis: 10),
                  DataPoint<double>(value: 40, xAxis: 15),
                  DataPoint<double>(value: 40, xAxis: 20),
                  DataPoint<double>(value: 40, xAxis: 25),
                  DataPoint<double>(value: 9, xAxis: 30),
                  DataPoint<double>(value: 11, xAxis: 35),
                ],
              ),
            ],
            config: BezierChartConfig(
              verticalIndicatorStrokeWidth: 2.0,
              verticalIndicatorColor: Colors.black12,
              showVerticalIndicator: true,
              verticalIndicatorFixedPosition: false,
              contentWidth: MediaQuery.of(context).size.width * 1.5,
              xAxisTextStyle: TextStyle(
                color: Colors.white60,
                fontSize: 19,
              ),
              footerHeight: 45,
              backgroundGradient: LinearGradient(
                colors: [
                  Colors.purpleAccent[400]!,
                  Colors.purpleAccent[400]!,
                  Colors.purpleAccent[700]!,
                  Colors.purpleAccent[700]!,
                  Colors.purpleAccent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

//SAMPLE DATE - WEEKLY

Widget sample3(BuildContext context) {
  final fromDate = DateTime(2019, 05, 22);
  final toDate = DateTime.now();
  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));
  return Center(
    child: Container(
      color: Colors.red,
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
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
        onScaleChanged: (scale) {
          print("Scale: $scale");
        },
        selectedDate: toDate,
        //this is optional
        footerDateTimeBuilder: (DateTime value, BezierChartScale? scaleType) {
          final newFormat = intl.DateFormat('dd/MM');
          return newFormat.format(value);
        },
        series: [
          BezierLine(
            label: "Duty",
            onMissingValue: (dateTime) {
              if (dateTime.day.isEven) {
                return 10.0;
              }
              return 5.0;
            },
            data: <DataPoint<DateTime>>[
              DataPoint<DateTime>(value: 10, xAxis: date1),
              DataPoint<DateTime>(value: 50, xAxis: date2),
            ],
          ),
        ],
        config: BezierChartConfig(
          displayDataPointWhenNoValue: false,
          verticalIndicatorStrokeWidth: 3.0,
          pinchZoom: true,
          physics: ClampingScrollPhysics(),
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: true,
          verticalIndicatorFixedPosition: false,
          backgroundColor: Colors.red,
        ),
      ),
    ),
  );
}

//SAMPLE DATE - MONTHLY

Widget sample4(BuildContext context) {
  final fromDate = DateTime(2018, 11, 22);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  final date3 = DateTime.now().subtract(Duration(days: 35));
  final date4 = DateTime.now().subtract(Duration(days: 36));

  final date5 = DateTime.now().subtract(Duration(days: 65));
  final date6 = DateTime.now().subtract(Duration(days: 64));

  return Center(
    child: Container(
      color: Colors.red,
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: BezierChart(
        bezierChartScale: BezierChartScale.MONTHLY,
        fromDate: fromDate,
        toDate: toDate,
        selectedDate: toDate,
        series: [
          BezierLine(
            label: "Duty",
            onMissingValue: (dateTime) {
              if (dateTime.month.isEven) {
                return 10.0;
              }
              return 5.0;
            },
            data: <DataPoint<DateTime>>[
              DataPoint<DateTime>(value: 10, xAxis: date1),
              DataPoint<DateTime>(value: 50, xAxis: date2),
              DataPoint<DateTime>(value: 20, xAxis: date3),
              DataPoint<DateTime>(value: 80, xAxis: date4),
              DataPoint<DateTime>(value: 14, xAxis: date5),
              DataPoint<DateTime>(value: 30, xAxis: date6),
            ],
          ),
        ],
        config: BezierChartConfig(
          verticalIndicatorStrokeWidth: 3.0,
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: true,
          verticalIndicatorFixedPosition: false,
          backgroundColor: Colors.red,
          footerHeight: 35.0,
        ),
      ),
    ),
  );
}

//SAMPLE DATE - YEARLY

Widget sample5(BuildContext context) {
  final fromDate = DateTime(2012, 11, 22);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  final date3 = DateTime.now().subtract(Duration(days: 300));
  final date4 = DateTime.now().subtract(Duration(days: 320));

  final date5 = DateTime.now().subtract(Duration(days: 650));
  final date6 = DateTime.now().subtract(Duration(days: 2000));

  final date7 = DateTime.now().subtract(Duration(days: 2500));

  return Center(
    child: Container(
      color: Colors.red,
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: BezierChart(
        bezierChartScale: BezierChartScale.YEARLY,
        fromDate: fromDate,
        toDate: toDate,
        selectedDate: toDate,
        series: [
          BezierLine(
            label: "Duty",
            data: <DataPoint<DateTime>>[
              DataPoint<DateTime>(value: 10, xAxis: date1),
              DataPoint<DateTime>(value: 50, xAxis: date2),
              DataPoint<DateTime>(value: 100, xAxis: date3),
              DataPoint<DateTime>(value: 100, xAxis: date4),
              DataPoint<DateTime>(value: 40, xAxis: date5),
              DataPoint<DateTime>(value: 47, xAxis: date6),
              DataPoint<DateTime>(value: 70, xAxis: date7),
            ],
          ),
          BezierLine(
            label: "Flight",
            lineColor: Colors.black26,
            onMissingValue: (dateTime) {
              if (dateTime.month.isEven) {
                return 10.0;
              }
              return 3.0;
            },
            data: <DataPoint<DateTime>>[
              DataPoint<DateTime>(value: 20, xAxis: date1),
              DataPoint<DateTime>(value: 30, xAxis: date2),
              DataPoint<DateTime>(value: 150, xAxis: date3),
              DataPoint<DateTime>(value: 80, xAxis: date4),
              DataPoint<DateTime>(value: 45, xAxis: date5),
              DataPoint<DateTime>(value: 45, xAxis: date6),
            ],
          ),
        ],
        config: BezierChartConfig(
          displayDataPointWhenNoValue: false,
          displayPreviousDataPointWhenNoValue: true,
          verticalIndicatorStrokeWidth: 3.0,
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: true,
          verticalIndicatorFixedPosition: false,
          backgroundGradient: LinearGradient(
            colors: [
              Colors.red[300]!,
              Colors.red[400]!,
              Colors.red[400]!,
              Colors.red[500]!,
              Colors.red,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          footerHeight: 35.0,
        ),
      ),
    ),
  );
}

//MAIN SAMPLE
Widget sample6(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black54,
          Colors.black87,
          Colors.black87,
        ],
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Bezier Chart",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        _buildChart(
          BezierChartScale.MONTHLY,
          context,
          LinearGradient(
            colors: [
              Colors.red[300]!,
              Colors.red[400]!,
              Colors.red[400]!,
              Colors.red[500]!,
              Colors.red,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        _buildChart(
            BezierChartScale.YEARLY,
            context,
            LinearGradient(
              colors: [
                Colors.purple[300]!,
                Colors.purple[400]!,
                Colors.purple[400]!,
                Colors.purple[500]!,
                Colors.purple,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ))
      ],
    ),
  );
}

_buildChart(
    BezierChartScale scale, BuildContext context, LinearGradient gradient) {
  final fromDate = DateTime(2012, 11, 22);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  final date3 = DateTime.now().subtract(Duration(days: 300));
  final date4 = DateTime.now().subtract(Duration(days: 320));

  final date5 = DateTime.now().subtract(Duration(days: 650));
  final date6 = DateTime.now().subtract(Duration(days: 652));

  return Center(
    child: Card(
      elevation: 10,
      margin: EdgeInsets.all(25.0),
      child: Container(
        color: Colors.red,
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        child: BezierChart(
          bezierChartScale: scale,
          fromDate: fromDate,
          toDate: toDate,
          selectedDate: toDate,
          series: [
            BezierLine(
              label: "Duty",
              onMissingValue: (dateTime) {
                if (dateTime.year.isEven) {
                  return 20.0;
                }
                return 5.0;
              },
              data: <DataPoint<DateTime>>[
                DataPoint<DateTime>(value: 10, xAxis: date1),
                DataPoint<DateTime>(value: 50, xAxis: date2),
                DataPoint<DateTime>(value: 100, xAxis: date3),
                DataPoint<DateTime>(value: 100, xAxis: date4),
                DataPoint<DateTime>(value: 40, xAxis: date5),
                DataPoint<DateTime>(value: 47, xAxis: date6),
              ],
            ),
            BezierLine(
              label: "Flight",
              lineColor: Colors.black26,
              onMissingValue: (dateTime) {
                if (dateTime.month.isEven) {
                  return 10.0;
                }
                return 3.0;
              },
              data: <DataPoint<DateTime>>[
                DataPoint<DateTime>(value: 20, xAxis: date1),
                DataPoint<DateTime>(value: 30, xAxis: date2),
                DataPoint<DateTime>(value: 150, xAxis: date3),
                DataPoint<DateTime>(value: 80, xAxis: date4),
                DataPoint<DateTime>(value: 45, xAxis: date5),
                DataPoint<DateTime>(value: 45, xAxis: date6),
              ],
            ),
          ],
          config: BezierChartConfig(
            verticalIndicatorStrokeWidth: 3.0,
            verticalIndicatorColor: Colors.black26,
            showVerticalIndicator: true,
            verticalIndicatorFixedPosition: false,
            backgroundGradient: gradient,
            footerHeight: 35.0,
          ),
        ),
      ),
    ),
  );
}

Widget sample7(BuildContext context) {
  return Container(
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
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width * 0.9,
              child: BezierChart(
                bezierChartScale: BezierChartScale.CUSTOM,
                xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
                footerValueBuilder: (double value) {
                  return "${formatAsIntOrDouble(value)}\ndays";
                },
                series: const [
                  BezierLine(
                    label: "m",
                    data: const [
                      DataPoint<double>(value: 100, xAxis: 0),
                      DataPoint<double>(value: 130, xAxis: 5),
                      DataPoint<double>(value: 300, xAxis: 10),
                      DataPoint<double>(value: 150, xAxis: 15),
                      DataPoint<double>(value: 75, xAxis: 20),
                      DataPoint<double>(value: 100, xAxis: 25),
                      DataPoint<double>(value: 250, xAxis: 30),
                      DataPoint<double>(value: 120, xAxis: 35),
                    ],
                  ),
                ],
                config: BezierChartConfig(
                  displayLinesXAxis: true,
                  startYAxisFromNonZeroValue: true,
                  bubbleIndicatorColor: Colors.white.withOpacity(0.9),
                  footerHeight: 40,
                  displayYAxis: true,
                  stepsYAxis: 15,
                  backgroundGradient: LinearGradient(
                    colors: [
                      Colors.red[300]!,
                      Colors.red[400]!,
                      Colors.red[400]!,
                      Colors.red[500]!,
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
  );
}

//SAMPLE 8 Hourly Chart
Widget sample8(BuildContext context) {
  final fromDate = DateTime.now().subtract(Duration(hours: 50));
  final toDate = DateTime.now();

  final date1 = toDate.subtract(Duration(hours: 2));
  final date2 = toDate.subtract(Duration(hours: 3));

  final date3 = toDate.subtract(Duration(hours: 10));
  final date4 = toDate.subtract(Duration(hours: 15));

  final date5 = toDate.subtract(Duration(hours: 19));
  final date6 = toDate.subtract(Duration(hours: 26));

  return Center(
    child: Container(
      color: Colors.red,
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: BezierChart(
        bezierChartScale: BezierChartScale.HOURLY,
        fromDate: fromDate,
        toDate: toDate,
        selectedDate: toDate,
        series: [
          BezierLine(
            label: "Duty",
            data: <DataPoint<DateTime>>[
              DataPoint<DateTime>(value: 0, xAxis: date1),
              DataPoint<DateTime>(value: 50, xAxis: date2),
              DataPoint<DateTime>(value: 100, xAxis: date3),
              DataPoint<DateTime>(value: 100, xAxis: date4),
              DataPoint<DateTime>(value: 40, xAxis: date5),
              DataPoint<DateTime>(value: 47, xAxis: date6),
            ],
          ),
        ],
        config: BezierChartConfig(
          verticalIndicatorStrokeWidth: 3.0,
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: true,
          verticalIndicatorFixedPosition: false,
          bubbleIndicatorTitleStyle: TextStyle(
            color: Colors.blue,
          ),
          bubbleIndicatorLabelStyle: TextStyle(
            color: Colors.red,
          ),
          displayYAxis: true,
          stepsYAxis: 25,
          backgroundGradient: LinearGradient(
            colors: [
              Colors.red[300]!,
              Colors.red[400]!,
              Colors.red[400]!,
              Colors.red[500]!,
              Colors.red,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          footerHeight: 35.0,
        ),
      ),
    ),
  );
}

//Example of the problem with BezierChartScale.WEEKLY
Widget sample9(BuildContext context) {
  int dateInt1 = 1562013034796;
  int dateInt2 = 1562079398067;
  final fromDate = DateTime.fromMillisecondsSinceEpoch(dateInt1);
  final toDate = DateTime.fromMillisecondsSinceEpoch(dateInt2);
  final DateTime date1 = DateTime.fromMillisecondsSinceEpoch(dateInt1);
  final DateTime date2 = DateTime.fromMillisecondsSinceEpoch(dateInt2);
  //final date1 = DateTime.now().subtract(Duration(days: 2));
  //final date2 = DateTime.now().subtract(Duration(days: 3));
  return Center(
    child: Container(
      color: Colors.red,
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
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
        footerDateTimeBuilder: (DateTime value, BezierChartScale? scaleType) {
          final newFormat = intl.DateFormat('dd/MM');
          return newFormat.format(value);
        },
        series: [
          BezierLine(
            label: "Duty",
            /*  onMissingValue: (dateTime) {
              if (dateTime.day.isEven) {
                return 10.0;
              }
              return 5.0;
            },*/
            data: <DataPoint<DateTime>>[
              DataPoint<DateTime>(value: 10, xAxis: date1),
              DataPoint<DateTime>(value: 50, xAxis: date2),
            ],
          ),
        ],
        config: BezierChartConfig(
          verticalIndicatorStrokeWidth: 3.0,
          pinchZoom: false,
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: true,
          verticalIndicatorFixedPosition: false,
          backgroundColor: Colors.red,
        ),
      ),
    ),
  );
}

// bubbleLabelDateTimeBuilder usage example
Widget sample11(BuildContext context) {
  final fromDate = DateTime(2019, 05, 22);
  final toDate = DateTime.now();
  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));
  return Center(
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
        footerDateTimeBuilder: (DateTime value, BezierChartScale? scaleType) {
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
              if (dateTime.day.isEven) {
                return 10.0;
              }
              return 5.0;
            },
            data: <DataPoint<DateTime>>[
              DataPoint<DateTime>(value: 30, xAxis: fromDate),
              DataPoint<DateTime>(value: 20, xAxis: date1),
              DataPoint<DateTime>(value: 50, xAxis: date2),
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
        ),
      ),
    ),
  );
}
