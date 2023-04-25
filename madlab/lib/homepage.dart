import 'package:flutter/material.dart';
import 'package:madlab/cricapi.dart';
import 'package:madlab/pieChart.dart';
import 'package:madlab/profilepage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home page"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('My Profile'),
                onTap: () {
                  Navigator.pop(context); // close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profile()),
                  );
                },
              ),
              ListTile(
                title: Text('Route 2'),
                onTap: () {
                  Navigator.pop(context); // close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MatchesList()),
                  );
                },
              ),
              ListTile(
                title: Text('Route 3'),
                onTap: () {
                  Navigator.pop(context); // close the drawer
                  Navigator.pushNamed(context, '/route3');
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),

                // Chart title
                title: ChartTitle(
                    text:
                        '\n IPL Team Performance Trends (Win Count): \nMumbai Indians (MI) '),
                // Enable legend
                legend: Legend(isVisible: false),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_Matches, String>>[
                  LineSeries<_Matches, String>(
                      dataSource: <_Matches>[
                        _Matches('2008', 7),
                        _Matches('2009', 5),
                        _Matches('2010', 11),
                        _Matches('2011', 10),
                        _Matches('2012', 10),
                        _Matches('2013', 13),
                        _Matches('2014', 7),
                        _Matches('2015', 10),
                        _Matches('2016', 7),
                        _Matches('2017', 12),
                        _Matches('2018', 6),
                        _Matches('2019', 11),
                        _Matches('2020', 9),
                      ],
                      xValueMapper: (_Matches WinCount, _) => WinCount.team,
                      yValueMapper: (_Matches WinCount, _) => WinCount.WinCount,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: '\n\nChennai Super Kings (CSK)'),
                // Enable legend
                legend: Legend(isVisible: false),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_Matches, String>>[
                  LineSeries<_Matches, String>(
                      dataSource: <_Matches>[
                        _Matches('2008', 9),
                        _Matches('2009', 8),
                        _Matches('2010', 9),
                        _Matches('2011', 11),
                        _Matches('2012', 10),
                        _Matches('2013', 12),
                        _Matches('2014', 9),
                        _Matches('2015', 10),
                        _Matches('2016', 0),
                        _Matches('2017', 0),
                        _Matches('2018', 11),
                        _Matches('2019', 10),
                        _Matches('2020', 6)
                      ],
                      xValueMapper: (_Matches WinCount, _) => WinCount.team,
                      yValueMapper: (_Matches WinCount, _) => WinCount.WinCount,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title:
                    ChartTitle(text: '\n\n Royal Challengers Bangalore (RCB)'),
                // Enable legend
                legend: Legend(isVisible: false),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_Matches, String>>[
                  LineSeries<_Matches, String>(
                      dataSource: <_Matches>[
                        _Matches('2008', 4),
                        _Matches('2009', 9),
                        _Matches('2010', 8),
                        _Matches('2011', 10),
                        _Matches('2012', 8),
                        _Matches('2013', 9),
                        _Matches('2014', 5),
                        _Matches('2015', 8),
                        _Matches('2016', 9),
                        _Matches('2017', 3),
                        _Matches('2018', 6),
                        _Matches('2019', 5),
                        _Matches('2020', 7)
                      ],
                      xValueMapper: (_Matches WinCount, _) => WinCount.team,
                      yValueMapper: (_Matches WinCount, _) => WinCount.WinCount,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: '\n\n Kolkata Knight Riders (KKR)'),
                // Enable legend
                legend: Legend(isVisible: false),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_Matches, String>>[
                  LineSeries<_Matches, String>(
                      dataSource: <_Matches>[
                        _Matches('2008', 6),
                        _Matches('2009', 3),
                        _Matches('2010', 7),
                        _Matches('2011', 8),
                        _Matches('2012', 12),
                        _Matches('2013', 6),
                        _Matches('2014', 11),
                        _Matches('2015', 7),
                        _Matches('2016', 8),
                        _Matches('2017', 9),
                        _Matches('2018', 9),
                        _Matches('2019', 6),
                        _Matches('2020', 7)
                      ],
                      xValueMapper: (_Matches WinCount, _) => WinCount.team,
                      yValueMapper: (_Matches WinCount, _) => WinCount.WinCount,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: '\n\n Delhi Capitals (DC)'),
                // Enable legend
                legend: Legend(isVisible: false),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_Matches, String>>[
                  LineSeries<_Matches, String>(
                      dataSource: <_Matches>[
                        _Matches('2008', 7),
                        _Matches('2009', 10),
                        _Matches('2010', 7),
                        _Matches('2011', 4),
                        _Matches('2012', 11),
                        _Matches('2013', 3),
                        _Matches('2014', 2),
                        _Matches('2015', 5),
                        _Matches('2016', 7),
                        _Matches('2017', 6),
                        _Matches('2018', 5),
                        _Matches('2019', 10),
                        _Matches('2020', 9)
                      ],
                      xValueMapper: (_Matches WinCount, _) => WinCount.team,
                      yValueMapper: (_Matches WinCount, _) => WinCount.WinCount,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.black,
            ),
            Text(
              'Toss Feature',
              style: TextStyle(fontSize: 24),
            ),
            PieChartExample(),
          ]),
        ));
  }
}

class _Matches {
  _Matches(this.team, this.WinCount);

  final String team;
  final double WinCount;
}
