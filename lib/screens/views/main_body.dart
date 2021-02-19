import 'dart:math';

import 'package:flutter/material.dart';

class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  TextEditingController customController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: deviceSize.width * 0.07,
          right: deviceSize.width * 0.07,
          top: deviceSize.height * 0.03,
          bottom: deviceSize.width * 0.01),
      child: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Question(
              'How Can I apply for Erasmus',
              'Ali Eren',
              context,
              customController,
              false,
              true,
            ),
            Question('When is the Application date', 'Betül Kurban', context,
                customController, false, false),
            Question(
                'Vize işlemlerinde okul yardımcı oluyor mu yoksa kendim mi halletmem gerkeli sdsjdasdasdasjdja jsajdaj Vize işlemlerinde okul yardımcı oluyor mu yoksa kendim mi halletmem gerkeli sdsjdasdasdasjdja jsajdaj Vize işlemlerinde okul yardımcı oluyor mu yoksa kendim mi halletmem gerkeli sdsjdasdasdasjdja jsajdaj ',
                'Aleyna Özgol',
                context,
                customController,
                true,
                true),
            Question(
                'Vize işlemlerinde okul yardımcı oluyor mu yoksa kendim mi halletmem gerkeli sdsjdasdasdasjdja jsajdaj Vize işlemlerinde okul yardımcı oluyor mu yoksa kendim mi halletmem gerkeli sdsjdasdasdasjdja jsajdaj Vize işlemlerinde okul yardımcı oluyor mu yoksa kendim mi halletmem gerkeli sdsjdasdasdasjdja jsajdaj ',
                'Aleyna Özgol',
                context,
                customController,
                false,
                false),
            Question(
                'Vize işlemlerinde okul yardımcı oluyor mu yoksa kendim mi halletmem gerkeli sdsjdasdasdasjdja jsajdaj Vize işlemlerinde okul yardımcı oluyor mu yoksa kendim mi halletmem gerkeli sdsjdasdasdasjdja jsajdaj Vize işlemlerinde okul yardımcı oluyor mu yoksa kendim mi halletmem gerkeli sdsjdasdasdasjdja jsajdaj ',
                'Aleyna Özgol',
                context,
                customController,
                false,
                false),
            Question(
                'Vize işlemlerinde okul yardımcı oluyor mu yoksa kendim mi halletmem gerkeli sdsjdasdasdasjdja jsajdaj Vize işlemlerinde okul yardımcı oluyor mu yoksa kendim mi halletmem gerkeli sdsjdasdasdasjdja jsajdaj Vize işlemlerinde okul yardımcı oluyor mu yoksa kendim mi halletmem gerkeli sdsjdasdasdasjdja jsajdaj ',
                'Aleyna Özgol',
                context,
                customController,
                true,
                false)
          ],
        ),
      ),
    );
  }
}

Widget Question(txt, user, context, customController, isAdmin, isAnswered) {
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Give An Answer'),
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

  answerDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('You need to apply for Erasmus first'),
          );
        });
  }

  noAnswerDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('No answer yet'),
          );
        });
  }

  //final isAdmin = false;
  //final isAnswered = false;

  Colors.primaries[Random().nextInt(Colors.primaries.length)];
  final deviceSize = MediaQuery.of(context).size;

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
    child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white70
            //color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Container(
                padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white54),
                child: Text(
                  'Soru sahibi : ' + user,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 3),
              child: ListTile(
                title: Text(
                  txt,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isAdmin)
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.reply_all_outlined),
                        onPressed: () {
                          if (isAdmin == true)
                            createAlertDialog(context);
                          else {}
                        },
                      ),
                    )
                  else
                    Container(color: Colors.transparent),
                  if (isAnswered == true)
                    GestureDetector(
                      onTap: () {
                        answerDialog(context);
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent),
                            child: Text('See the answer',
                                style: TextStyle(
                                  color: Colors.black,
                                )),
                          ),
                          Icon(Icons.check_rounded)
                        ],
                      ),
                    )
                  else
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent),
                      child: Text('See the answer',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                    )
                ],
              ),
            ),
          ],
        )),
  );
}
