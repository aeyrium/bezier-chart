import 'package:bezier_chart/bezier_chart.dart';
import 'package:bezier_chart/src/my_single_child_scroll_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
  }

  MySingleChildScrollView _getScrollViewFromBezierChart(WidgetTester tester) {
    return tester.widget<MySingleChildScrollView>(
      find
          .descendant(
            of: find.byType(BezierChart),
            matching: find.byType(MySingleChildScrollView),
          )
          .first,
    );
  }

  Container _getContainerFromBezierChart(WidgetTester tester) {
    return tester.widget<Container>(
      find
          .descendant(
            of: find.byType(BezierChart),
            matching: find.byType(Container),
          )
          .first,
    );
  }

  Widget _buildWidget({
    double? height,
    double? width,
    double? contentWidth,
    Color backgroundColor = Colors.white,
    LinearGradient? backgroundGradient,
  }) {
    return Center(
      child: Container(
        height: height,
        width: width,
        child: BezierChart(
          bezierChartScale: BezierChartScale.CUSTOM,
          xAxisCustomValues: const [
            0,
            5,
            10,
            15,
          ],
          series: const [
            BezierLine(
              data: const [
                DataPoint<double>(value: 10, xAxis: 0),
                DataPoint<double>(value: 130, xAxis: 5),
                DataPoint<double>(value: 50, xAxis: 10),
                DataPoint<double>(value: 150, xAxis: 15),
              ],
            ),
          ],
          config: BezierChartConfig(
            contentWidth: contentWidth,
            backgroundColor: backgroundColor,
            backgroundGradient: backgroundGradient,
          ),
        ),
      ),
    );
  }

  final height = 300.0;
  final width = 350.0;

  testWidgets(
    'Test Size and Aligment',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          _buildWidget(
            height: height,
            width: width,
          ),
        ),
      );

      await tester.pump();

      final scrollView = _getScrollViewFromBezierChart(tester);
      expect(scrollView.child is Align, true);
      expect(scrollView.physics.runtimeType, NeverScrollableScrollPhysics);
      final align = (scrollView.child as Align);
      expect(align.alignment, Alignment(0.0, 0.7));
      expect(align.child is CustomPaint, true);
      final customPainter = align.child as CustomPaint;
      final localHorizontalPadding = 50.0;
      final localVerticalPercent = 0.75;
      expect(scrollView.padding!.horizontal, localHorizontalPadding * 2);
      expect(customPainter.size.width, width - 2 * localHorizontalPadding);
      expect(customPainter.size.height, height * localVerticalPercent);
    },
  );

  testWidgets(
    'Test content Width',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          _buildWidget(
            height: height,
            width: width,
            contentWidth: width * 2,
          ),
        ),
      );

      await tester.pump();

      final scrollView = _getScrollViewFromBezierChart(tester);
      expect(scrollView.child is Align, true);
      expect(scrollView.scrollDirection, Axis.horizontal);
      expect(scrollView.physics.runtimeType, AlwaysScrollableScrollPhysics);
      final align = (scrollView.child as Align);
      expect(align.child is CustomPaint, true);
      final customPainter = align.child as CustomPaint;
      expect(customPainter.size.width, width * 2);
    },
  );

  testWidgets(
    'Test color/gradient configuration',
    (WidgetTester tester) async {
      final customColor = Color.fromRGBO(100, 100, 100, 1.0);
      final gradientColor = LinearGradient(
        colors: [Colors.white, Colors.red],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );

      await tester.pumpWidget(
        buildTestableWidget(
          _buildWidget(
            height: height,
            width: width,
            backgroundColor: customColor,
          ),
        ),
      );

      await tester.pump();
      final container1 = _getContainerFromBezierChart(tester);
      final decoration1 = (container1.decoration as BoxDecoration);
      expect(decoration1.color, customColor);
      expect(decoration1.gradient, isNull);

      await tester.pumpWidget(
        buildTestableWidget(
          _buildWidget(
            height: height,
            width: width,
            backgroundGradient: gradientColor,
          ),
        ),
      );

      await tester.pump();
      final container2 = _getContainerFromBezierChart(tester);
      final decoration2 = (container2.decoration as BoxDecoration);
      expect(decoration2.color, isNull);
      expect(decoration2.gradient, gradientColor);
    },
  );

  testWidgets(
    'Test series',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          _buildWidget(
            height: height,
            width: width,
          ),
        ),
      );

      await tester.pump();

      final state = tester.state(find.byType(BezierChart)) as BezierChartState;
      expect(state.computedSeries.length, 1);
      expect(state.computedSeries.first.data!.length, 4);
    },
  );
}
