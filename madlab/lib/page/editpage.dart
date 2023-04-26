import 'package:flutter/material.dart';
import '../models/players.dart';
import '../services/firebasecrud.dart';
import 'package:madlab/page/listpage.dart';

class EditPage extends StatefulWidget {
  final Cricketdata? cricketdata;

  EditPage({this.cricketdata});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditPage();
  }
}

class _EditPage extends State<EditPage> {
  final _cricketdata_teamname = TextEditingController();
  final _cricketdata_playername = TextEditingController();
  final _cricketdata_playerage = TextEditingController();
  final _cricketdata_playingrole = TextEditingController();
  final _cricketdata_matchesplayed = TextEditingController();
  final _cricketdata_matcheswon = TextEditingController();
  final _cricketdata_matcheslost = TextEditingController();
  final _docid = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _docid.value = TextEditingValue(text: widget.cricketdata!.uid.toString());
    _cricketdata_teamname.value =
        TextEditingValue(text: widget.cricketdata!.teamname.toString());
    _cricketdata_playername.value =
        TextEditingValue(text: widget.cricketdata!.playername.toString());
    _cricketdata_playerage.value =
        TextEditingValue(text: widget.cricketdata!.playerage.toString());
    _cricketdata_playingrole.value =
        TextEditingValue(text: widget.cricketdata!.playingrole.toString());
    _cricketdata_matchesplayed.value =
        TextEditingValue(text: widget.cricketdata!.matchesplayed.toString());
    _cricketdata_matcheswon.value =
        TextEditingValue(text: widget.cricketdata!.matcheswon.toString());
    _cricketdata_matcheslost.value =
        TextEditingValue(text: widget.cricketdata!.matcheslost.toString());
  }

  @override
  Widget build(BuildContext context) {
    final DocIDField = TextField(
        controller: _docid,
        readOnly: true,
        autofocus: false,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final teamnameField = TextFormField(
        controller: _cricketdata_teamname,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Team Name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final playernameField = TextFormField(
        controller: _cricketdata_playername,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Player Name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final playerageField = TextFormField(
        controller: _cricketdata_playerage,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Player Age",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final playingroleField = TextFormField(
        controller: _cricketdata_playingrole,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Playing Role",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final matchesplayedField = TextFormField(
        controller: _cricketdata_matchesplayed,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Matches Played",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    // final matcheswonField = TextFormField(
    //     controller: _cricketdata_matcheswon,
    //     autofocus: false,
    //     validator: (value) {
    //       if (value == null || value.trim().isEmpty) {
    //         return 'This field is required';
    //       }
    //     },
    //     decoration: InputDecoration(
    //         contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //         hintText: "Matches Won",
    //         border:
    //             OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    // final matcheslostField = TextFormField(
    //     controller: _cricketdata_matcheslost,
    //     autofocus: false,
    //     validator: (value) {
    //       if (value == null || value.trim().isEmpty) {
    //         return 'This field is required';
    //       }
    //     },
    //     decoration: InputDecoration(
    //         contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //         hintText: "Matches Lost",
    //         border:
    //             OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final viewListbutton = TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => ListPage(),
            ),
            (route) => false, //if you want to disable back feature set to false
          );
        },
        child: const Text('View List of Predictions'));

    final SaveButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await FirebaseCrud.updatecricketdata(
                teamname: _cricketdata_teamname.text,
                playername: _cricketdata_playername.text,
                playerage: _cricketdata_playerage.text,
                playingrole: _cricketdata_playingrole.text,
                matchesplayed: _cricketdata_matchesplayed.text,
                matcheswon: _cricketdata_matcheswon.text,
                matcheslost: _cricketdata_matcheslost.text,
                docId: _docid.text);
            if (response.code != 200) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            }
          }
        },
        child: Text(
          "Update",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Edit CricPredictions'),
        // backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // DocIDField,
                  const SizedBox(height: 17.0),
                  teamnameField,
                  const SizedBox(height: 17.0),
                  playernameField,
                  const SizedBox(height: 17.0),
                  playerageField,
                  const SizedBox(height: 17.0),
                  playingroleField,
                  const SizedBox(height: 17.0),
                  matchesplayedField,
                  // const SizedBox(height: 17.0),
                  // matcheswonField,
                  // const SizedBox(height: 17.0),
                  // matcheslostField,
                  viewListbutton,
                  const SizedBox(height: 30.0),
                  SaveButon,
                  const SizedBox(height: 17.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
