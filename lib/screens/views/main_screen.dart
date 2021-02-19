import 'dart:ui';

import 'package:bau_help_desk/screens/views/main_body.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController customController = TextEditingController();

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Ask Your Question'),
            content: TextField(
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  labelText: 'Please write here',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10))),
              keyboardType: TextInputType.text,
              controller: customController,
            ),
            actions: [
              IconButton(
                  padding: EdgeInsets.all(12),
                  icon: Icon(Icons.send),
                  onPressed: () {
                    //SUBMIT FUNCTION TO DB
                    Navigator.pop(context);
                    customController = null;
                  })
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF8B7053),
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0XFF8B7053),
        title: Text('BAU EXCHANGE HELP DESK'),
      ),
      body: MainBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAlertDialog(context);
        },
        child: Text(
          'Ask Q',
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Color(0XFF8B7053)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('ALİ EREN'),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.input),
              title: Text('My Questions'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
    );
  }
}
