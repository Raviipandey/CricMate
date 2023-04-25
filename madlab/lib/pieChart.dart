import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

/// Data class to visualize.
class _CostsData {
  final String category;
  final double cost;

  const _CostsData(this.category, this.cost);
}

class PieChartExample extends StatefulWidget {
  const PieChartExample({super.key});

  @override
  _PieChartExampleState createState() => _PieChartExampleState();
}

class _PieChartExampleState extends State<PieChartExample> {
  // Chart configs.
  bool _animate = true;
  bool _defaultInteractions = true;
  double _arcRatio = 1;
  charts.ArcLabelPosition _arcLabelPosition = charts.ArcLabelPosition.auto;
  charts.BehaviorPosition _titlePosition = charts.BehaviorPosition.bottom;
  charts.BehaviorPosition _legendPosition = charts.BehaviorPosition.bottom;

  // Data to render.
  final List<_CostsData> _data = [
    const _CostsData('Yes', 43.7),
    const _CostsData('No', 56.3),
  ];

  @override
  Widget build(BuildContext context) {
    final _colorPalettes =
        charts.MaterialPalette.getOrderedPalettes(this._data.length);
    return Column(
      children: <Widget>[
        SizedBox(
          height: 300,
          // MUST specify the type T, see https://github.com/google/charts/issues/668#issuecomment-943556524.
          child: charts.PieChart<String>(
            // Pie chart can only render one series.
            [
              charts.Series<_CostsData, String>(
                id: 'Sales-1',
                colorFn: (_, idx) => _colorPalettes[idx!].shadeDefault,
                domainFn: (_CostsData sales, _) => sales.category,
                measureFn: (_CostsData sales, _) => sales.cost,
                data: this._data,
                // Set a label accessor to control the text of the arc label.
                labelAccessorFn: (_CostsData row, _) =>
                    '${row.category}: ${row.cost}',
              ),
            ],
            animate: this._animate,
            defaultRenderer: charts.ArcRendererConfig(
              arcRatio: this._arcRatio,
              arcRendererDecorators: [
                charts.ArcLabelDecorator(labelPosition: this._arcLabelPosition)
              ],
            ),
            behaviors: [
              // Add title.
              charts.ChartTitle(
                '',
                behaviorPosition: this._titlePosition,
              ),
              // Add legend. ("Datum" means the "X-axis" of each data point.)
              // charts.DatumLegend(
              //   position: this._legendPosition,
              //   desiredMaxRows: 2,
              // ),
              charts.DatumLegend(
                position: this._legendPosition,
                desiredMaxRows: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Widgets to control the chart appearance and behavior.
}
}
