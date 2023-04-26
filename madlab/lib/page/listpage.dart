import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:madlab/models/players.dart';

import '../services/firebasecrud.dart';
import 'addpage.dart';
import 'editpage.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPage();
  }
}

class _ListPage extends State<ListPage> {
  final Stream<QuerySnapshot> collectionReference =
      FirebaseCrud.readcricketdata();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pushAndRemoveUntil<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => AddPage(),
              ),
              (route) =>
                  true, //if you want to disable back feature set to false
            );
          },
        ),
        title: const Text("List of Predictions"),
        // backgroundColor: Theme.of(context).primaryColor,
        // backgroundColor: ,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.app_registration,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => AddPage(),
                ),
                (route) =>
                    false, //if you want to disable back feature set to false
              );
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView(
                children: snapshot.data!.docs.map((e) {
                  return Card(
                      child: Column(children: [
                    ListTile(
                      title: Text(e["Player Name"]),
                      subtitle: Container(
                        child: (Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Team Name: " + e['Team Name'].toString(),
                                style: const TextStyle(fontSize: 14)),
                            Text("Prediction: " + e['Player age'].toString(),
                                style: const TextStyle(fontSize: 14)),
                            Text(
                                "Playing role: " + e['Playing role'].toString(),
                                style: const TextStyle(fontSize: 14)),
                            Text(
                                "Win Percent: " +
                                    e['Matches played'].toString(),
                                style: const TextStyle(fontSize: 14)),
                          ],
                        )),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(5.0),
                            // primary: const Color.fromARGB(255, 143, 133, 226),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: const Text('Edit'),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) => EditPage(
                                  cricketdata: Cricketdata(
                                    uid: e.id,
                                    teamname: e["Team Name"],
                                    playername: e["Player Name"],
                                    playerage: e["Player age"],
                                    playingrole: e["Playing role"],
                                    matchesplayed: e["Matches played"],
                                    // matcheswon: e["Matches won"],
                                    // matcheslost: e["Matches lost"],
                                  ),
                                ),
                              ),
                              (route) =>
                                  true, //if you want to disable back feature set to false
                            );
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(5.0),
                            // primary: const Color.fromARGB(255, 143, 133, 226),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: const Text('Delete'),
                          onPressed: () async {
                            var response = await FirebaseCrud.deletecricketdata(
                                docId: e.id);
                            if (response.code != 200) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content:
                                          Text(response.message.toString()),
                                    );
                                  });
                            }
                          },
                        ),
                      ],
                    ),
                  ]));
                }).toList(),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
