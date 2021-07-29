## [2.0.0]

- Migrated to null-safety.

## [1.0.17 - 1.0.17+1]

- Format bubble value and `updatePositionOnTap` were added. Thanks @ltdangkhoa.

## [1.0.16]

- `dataPointFillColor` and `dataPointStrokeColor` were added in BezierLine.
- `verticalLineFullHeight` was added in `BezierChartConfig`.
- `onScaleChanged` was added in `BezierChart` to notify when the scale was changed.
- Issue related to updating the chart with new data fixed. https://github.com/aeyrium/bezier-chart/issues/62
- Web support was added

## [1.0.15]

- Fixed a bug related to `BezierChartScale.WEEKLY`
- new property added `bezierChartAggregation` for `BezierChartConfig`
- if datapoints now overlap the chosen aggregation method is used -> Supported are: `AVERAGE`, `SUM`, `FIRST`, `COUNT`

## [1.0.14]

- Fixed a bug related to `stepsYAxis` value
- new property added `displayDataPointWhenNoValue` for `BezierChartConfig`
- new property added `physics` for `BezierChartConfig`
- Added `bubbleLabelValueBuilder` and `bubbleLabelDateTimeBuilder` callbacks

## [1.0.13]

- `selectedValue` was added for `BezierChartScale.CUSTOM`

## [1.0.12]

- `verticalIndicatorFixedPosition` from `BezierChartConfig` was changed `false` by default.
- `stepsYAxis` was added to `BezierChartConfig` , it works only if `displayYAxis` is [true]. e.g: stepsYAxis : 5 ,  if your maxValue is 100, then the Y values should be: [0,5,10,15 .... 100]  (Check `sample1` or `sample7`)
- `bubbleIndicatorLabelStyle`, `bubbleIndicatorTitleStyle` and `bubbleIndicatorValuetyle` were added inside `BezierChartConfig` to allow customization for the bubble indicator panel.
- bugs fixing


## [1.0.11]

- `onIndicatorVisible` callback was added to check when the indicator is visible or not
- `onValueSelected` was added , it displays the current `double` value selected by the indicator (if the chart is CUSTOM).
- `onDateTimeSelected` was added, it displays the current `DateTime` selected by the indicator (if the chart is Date type).
- New date type chart added `BezierChartScale.HOURLY` , doesn't support zoom.

## [1.0.10]

- Fixed `pinchZoom` for `BezierChartConfig`.
- `footerDateTimeBuilder` was added as optional inside `BezierChart`, it allows you to display custom X footer for each `DateTime` value.

## [1.0.9]

- Optimizing `for` loops removing unnecessary convertion from `Iterable` to `List`.
- `startYAxisFromNonZeroValue` property was added, if you are displaying the Y Axis then your chart will start from your lower value, if you set it to `false`, it will start from zero.
- `displayLinesXAxis` and `xLinesColor` were added to display a vertical line on each X data point, it only works when there is one `BezierLine`.

## [1.0.8]

* Chart starts from the first data point, not from zero.
* `displayYAxis` was added (false by default).
* `footerColor` was removed from `BezierChartConfig`, now you can use `xAxisTextStyle` or `yAxisTextStyle` both are `TextStyle`.

## [1.0.1 - 1.0.7] - Added example documentation

- Added an example README.md for the `bezier_chart` package.
- Added a repository url to the pubspec

## [1.0.0] - First release

- First release of our beautiful `bezier_chart` package.
