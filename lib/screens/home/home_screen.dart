import 'package:sfero/globals.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sfero/screens/home/components/body.dart';

import 'components/body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text(
          'Sfero',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[300],
        onPressed: () {
          _showMyDialog(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

Future<String> _showMyDialog(BuildContext context) async {
  TextEditingController controll = TextEditingController();

  void createRecord() async {
    await FirebaseFirestore.instance
        .collection((globals.userState == true) ? "pacha_list" : "dacha_list")
        .doc(controll.text)
        .set({'name': controll.text, 'counter': 0});
    print("success");
  }

  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Введите название желания'),
        content: TextField(
          controller: controll,
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Отмена'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Добавить желание'),
            onPressed: () {
              createRecord();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
