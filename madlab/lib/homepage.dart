import 'package:flutter/material.dart';
import 'package:madlab/cricapi.dart';
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
                        'Season Feature \n IPL Team Performance Statistic (Win Count): \nMumbai Indians '),
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
                title: ChartTitle(
                    text:
                        'IPL Team Performance Statistic (Win Count): \nSeason 2014'),
                // Enable legend
                legend: Legend(isVisible: false),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_Matches, String>>[
                  LineSeries<_Matches, String>(
                      dataSource: <_Matches>[
                        _Matches('SRH', 4),
                        _Matches('MI', 3),
                        _Matches('GL', 0),
                        _Matches('RPS', 0),
                        _Matches('RCB', 5),
                        _Matches('KKR', 6),
                        _Matches('DD', 2),
                        _Matches('KXIP', 8),
                        _Matches('CSK', 8),
                        _Matches('RR', 7),
                        _Matches('SRH1', 0)
                      ],
                      xValueMapper: (_Matches WinCount, _) => WinCount.team,
                      yValueMapper: (_Matches WinCount, _) => WinCount.WinCount,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(
                    text:
                        'IPL Team Performance Statistic (Win Count):\n Season 2013'),
                // Enable legend
                legend: Legend(isVisible: false),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_Matches, String>>[
                  LineSeries<_Matches, String>(
                      dataSource: <_Matches>[
                        _Matches('SRH', 10),
                        _Matches('MI', 13),
                        _Matches('GL', 0),
                        _Matches('RPS', 4),
                        _Matches('RCB', 9),
                        _Matches('KKR', 6),
                        _Matches('DD', 3),
                        _Matches('KXIP', 8),
                        _Matches('CSK', 12),
                        _Matches('RR', 11),
                        _Matches('SRH1', 0)
                      ],
                      xValueMapper: (_Matches WinCount, _) => WinCount.team,
                      yValueMapper: (_Matches WinCount, _) => WinCount.WinCount,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(
                    text:
                        'IPL Team Performance Statistic (Win Count):\n Season 2012'),
                // Enable legend
                legend: Legend(isVisible: false),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_Matches, String>>[
                  LineSeries<_Matches, String>(
                      dataSource: <_Matches>[
                        _Matches('SRH', 4),
                        _Matches('MI', 10),
                        _Matches('GL', 0),
                        _Matches('RPS', 4),
                        _Matches('RCB', 8),
                        _Matches('KKR', 12),
                        _Matches('DD', 11),
                        _Matches('KXIP', 8),
                        _Matches('CSK', 10),
                        _Matches('RR', 7),
                        _Matches('SRH1', 0)
                      ],
                      xValueMapper: (_Matches WinCount, _) => WinCount.team,
                      yValueMapper: (_Matches WinCount, _) => WinCount.WinCount,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ])
          ]),
        ));
  }
}

class _Matches {
  _Matches(this.team, this.WinCount);

  final String team;
  final double WinCount;
}
