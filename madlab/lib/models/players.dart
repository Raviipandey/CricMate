import 'dart:ffi';

class Cricketdata {
  String? uid;
  String? teamname;
  String? playername;
  String? playerage;
  String? playingrole;
  String? matchesplayed;
  String? matcheswon;
  String? matcheslost;

  Cricketdata(
      {this.uid,
      this.teamname,
      this.playername,
      this.playerage,
      this.playingrole,
      this.matchesplayed,
      this.matcheswon,
      this.matcheslost});
}
