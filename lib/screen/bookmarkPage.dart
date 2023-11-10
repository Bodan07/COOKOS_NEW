import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dev/model/Resep.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dev/model/Profile.dart';
import 'package:flutter_dev/widget/thumbnail_resep.dart';

class bookmarkPage extends StatefulWidget {
  const bookmarkPage({Key? key}) : super(key: key);

  @override
  State<bookmarkPage> createState() => _bookmarkPage();
}

class _bookmarkPage extends State<bookmarkPage> {
  File? image;

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
                        image != null
                            ? Container(
                                margin: EdgeInsets.only(top: 50),
                                child: ClipOval(
                                  child: Image.file(
                                    image!,
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 50),
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              )
                      ],
                    )),
                  ),
                ],
              ),
              Container(
                child: Expanded(
                  child: ListView.builder(
                      itemCount: listr.length,
                      itemBuilder: (context, index) {
                        if (index <= listr.length) {
                          final iniresep = listr[index];
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
