import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sfero/globals.dart' as globals;
import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}

Widget _buildBody(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection((globals.userState == true) ? 'pacha_list' : 'dacha_list')
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return CircularProgressIndicator();

      return buildList(context, snapshot.data.docs);
    },
  );
}

Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    padding: const EdgeInsets.only(top: 20.0),
    children: snapshot.map((data) => buildListItem(context, data)).toList(),
  );
}

Widget buildListItem(BuildContext context, DocumentSnapshot data) {
  final record = Record.fromSnapshot(data);

  void deleteData() async {
    await FirebaseFirestore.instance
        .collection((globals.userState == true) ? 'pacha_list' : 'dacha_list')
        .doc(record.name)
        .delete();
  }

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          child: Card(
            elevation: 4,
            margin: EdgeInsets.all(10),
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.delete), onPressed: () => {deleteData()}),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPaddin),
                  child: Text(
                    record.name,
                    style: kDefaultFontStyle,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add),
                      iconSize: 20,
                      onPressed: () => {
                        if (record.counter >= 0)
                          {
                            record.reference
                                .update({'counter': FieldValue.increment(1)}),
                          }
                      },
                    ),
                    Text(
                      record.counter.toString(),
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: kTextWhiteColor),
                    ),
                    IconButton(
                      icon: Icon(Icons.minimize),
                      iconSize: 20,
                      onPressed: () => {
                        if (record.counter > 0)
                          {
                            record.reference
                                .update({'counter': FieldValue.increment(-1)}),
                          }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

class Record {
  final String name;
  final int counter;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['counter'] != null),
        name = map['name'],
        counter = map['counter'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
