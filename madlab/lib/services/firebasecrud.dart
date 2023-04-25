import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/dbresponse.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('cricketdata');

class FirebaseCrud {
  static Future<Response> addcricketdata({
    required String teamname,
    required String playername,
    required String playerage,
    required String playingrole,
    required String matchesplayed,
    required String matcheswon,
    required String matcheslost,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "Team Name": teamname,
      "Player Name": playername,
      "Player age": playerage,
      "Playing role": playingrole,
      "Matches played": matchesplayed,
      "Matches won": matcheswon,
      "Matches lost": matcheslost,
    };

    var result = await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Future<Response> updatecricketdata({
    required String teamname,
    required String playername,
    required String playerage,
    required String playingrole,
    required String matchesplayed,
    required String matcheswon,
    required String matcheslost,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "Team Name": teamname,
      "Player Name": playername,
      "Player age": playerage,
      "Playing role": playingrole,
      "Matches played": matchesplayed,
      "Matches won": matcheswon,
      "Matches lost": matcheslost,
    };

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated cricketdata";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Stream<QuerySnapshot> readcricketdata() {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.snapshots();
  }

  static Future<Response> deletecricketdata({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully Deleted cricketdata";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
