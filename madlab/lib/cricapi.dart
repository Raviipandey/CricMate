import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Match {
  final int matchNumber;
  final String team1;
  final String team2;
  final String date;
  final String time;
  final String location;

  Match({
    required this.matchNumber,
    required this.team1,
    required this.team2,
    required this.date,
    required this.time,
    required this.location,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      matchNumber: json['matchNumber'],
      team1: json['team1'],
      team2: json['team2'],
      date: json['date'],
      time: json['time'],
      location: json['location'],
    );
  }
}

class MatchesList extends StatefulWidget {
  @override
  _MatchesListState createState() => _MatchesListState();
}

class _MatchesListState extends State<MatchesList> {
  List<Match> _matches = [];

  @override
  void initState() {
    super.initState();
    fetchMatches();
  }

  Future<void> fetchMatches() async {
    final response = await http.get(Uri.parse(
        'https://gist.githubusercontent.com/Raviipandey/7d99c23424937404bcf4186a5ecd051b/raw/df2182fa32492d3d40d19da4a906608cbb972673/cricketdata'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      setState(() {
        _matches = jsonData.map((item) => Match.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to load matches');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cricket Matches'),
      ),
      body: ListView.builder(
        itemCount: _matches.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text('Match ${_matches[index].matchNumber}'),
              subtitle:
                  Text('${_matches[index].team1} vs ${_matches[index].team2}'),
              trailing:
                  Text('${_matches[index].date}, ${_matches[index].time}'),
            ),
          );
        },
      ),
    );
  }
}
