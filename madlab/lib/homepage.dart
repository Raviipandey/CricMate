import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madlab/cricapi.dart';
import 'package:madlab/page/addpage.dart';
import 'package:madlab/pieChart.dart';
import 'package:madlab/profilepage.dart';
import 'package:madlab/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
          width: 250,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          'CricMate',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CircleAvatar(
                        radius: 41.5,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/profilepic.jpg"),
                          maxRadius: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // const Divider(
              //   height: 0.0,
              //   thickness: 2.0,
              // ),
              ListTile(
                title: Text(
                  'My Profile',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context); // close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profile()),
                  );
                },
              ),
              const Divider(
                height: 0.0,
                thickness: 2.0,
              ),
              ListTile(
                title: Text('Fixtures', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context); // close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MatchesList()),
                  );
                },
              ),
              const Divider(
                height: 0.0,
                thickness: 2.0,
              ),
              ListTile(
                title: Text('CricPredictions', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context); // close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPage()),
                  );
                },
              ),
              // const Divider(
              //   height: 0.0,
              //   thickness: 2.0,
              // ),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove('user_uid');
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
                child: Text('Logout', style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  '\n IPL Team Performance Trends (Win Count): ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),

                // Chart title
                title: ChartTitle(text: '\nMumbai Indians (MI) '),
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
              '\nToss Feature:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Analysis of the teams winning or losing  the match based on the toss won:',
                style: TextStyle(fontSize: 17),
              ),
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
