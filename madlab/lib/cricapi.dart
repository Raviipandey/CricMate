import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Match {
  final int matchNumber;
  final String team1;
  final String team2;
  final String Date;
  final String Time;
  final String location;

  Match({
    required this.matchNumber,
    required this.team1,
    required this.team2,
    required this.Date,
    required this.Time,
    required this.location,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      matchNumber: json['matchNumber'],
      team1: json['team1'],
      team2: json['team2'],
      Date: json['Date'],
      Time: json['Time'],
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
        'https://gist.githubusercontent.com/jasmit21/0c554af3792958dafaf2d16900a1b3d3/raw/bee41b75e4fa848958af3703815fef78795e88ce/crickData.json'));

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
                  Text('${_matches[index].Date}, ${_matches[index].Time}'),
            ),
          );
        },
      ),
    );
  }
}
