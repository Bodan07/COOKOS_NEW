import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/model/Resep.dart';
import 'package:flutter_dev/model/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dev/model/Profile.dart';
import 'package:flutter_dev/widget/thumbnail_resep.dart';

class bookmarkPage extends StatefulWidget {
  const bookmarkPage({Key? key}) : super(key: key);

  @override
  State<bookmarkPage> createState() => _bookmarkPage();
}

class _bookmarkPage extends State<bookmarkPage> {
  List<Resep> listbookmark = [];
  File? image;

  void initState() {
    super.initState();
    setState(() {
      //getbookmark();
    });
  }

  void getbookmark() async {
    List<dynamic> bookmarktemp = [];
    final usercollection = FirebaseFirestore.instance.collection('user');
    var doc = await usercollection.doc(context.read<user>().id_user).get();
    if (doc.exists) {
      Map<String, dynamic> data = doc.data()!;
      bookmarktemp = data['bookmark'];
      print(bookmarktemp);

      if (bookmarktemp.isEmpty) {
        setState(() {
          listbookmark = [];
          print(listbookmark);
        });
      } else {
        final resepcollection = FirebaseFirestore.instance.collection('resep');
        QuerySnapshot resepsnapshot = await resepcollection
            .where(FieldPath.documentId, whereIn: bookmarktemp)
            .get();
        setState(() {
          listbookmark = List.from(
              resepsnapshot.docs.map((doc) => Resep.fromSnapshot(doc)));
          print(listbookmark);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xffe5737d),
          centerTitle: true,
          title: Text(
            'Bookmark',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Rubik',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffe5737d),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(14)),
                    ),
                    child: (Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 50),
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      context.watch<Profile>().image),
                                  fit: BoxFit.cover),
                            ))
                      ],
                    )),
                  ),
                ],
              ),
              Container(
                child: Expanded(
                  child: ListView.builder(
                      itemCount: context.watch<user>().bookmark.length,
                      itemBuilder: (context, index) {
                        if (index <= context.watch<user>().bookmark.length) {
                          final iniresep =
                              context.watch<user>().bookmark[index];
                          return thumbnailResep(
                            iniresep: iniresep,
                          );
                        }
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
