//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dev/model/Profile.dart';

class seeProfile extends StatefulWidget {
  const seeProfile({Key? key}) : super(key: key);

  @override
  State<seeProfile> createState() => _seeProfile();
}

class _seeProfile extends State<seeProfile> {
  TextEditingController editController = TextEditingController();
  TextEditingController bookmarkController = TextEditingController();

  void _edit() {
    String edit = editController.text;
    Navigator.pushNamed(context, "/edit_profile");
  }

  void _bookmark() {
    String bookmark = bookmarkController.text;
    Navigator.pushNamed(context, "/rating_review");
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
            'My Profile',
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
                margin: const EdgeInsets.only(top: 40),
                child: Text(
                  context.watch<Profile>().nama,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: _edit,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: const Color(0xffe5737d), // Ubah warna teks
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    minimumSize: const Size(230, 50),
                  ),
                  child: const Text(
                    'Edit',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: _bookmark,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: const Color(0xffe5737d), // Ubah warna teks
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    minimumSize: const Size(230, 50),
                  ),
                  child: const Text(
                    'Bookmark',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
