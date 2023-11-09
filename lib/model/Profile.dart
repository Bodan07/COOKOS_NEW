import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'User.dart';
import 'package:provider/provider.dart';

class Profile extends ChangeNotifier {
  String id_user;
  String nama;
  int usia;
  String jenis_Kelamin;
  String tanggal_lahir;
  String image;

  void setid(String uid) {
    this.id_user = id_user;
  }

  Profile(
      {this.id_user = "",
      this.nama = "",
      this.usia = 0,
      this.jenis_Kelamin = "",
      this.tanggal_lahir = "",
      this.image =
          "https://firebasestorage.googleapis.com/v0/b/cookos.appspot.com/o/image%2FScreenshot%20(171).png?alt=media&token=c5302e01-2554-4eef-91b5-ff5855cce043"});

  void changeProfile(
      {required String n,
      required int u,
      required String jk,
      required String tl,
      required String img}) async {
    nama = n;
    usia = u;
    jenis_Kelamin = jk;
    tanggal_lahir = tl;
    image = img;
    notifyListeners();
  }

  void getdata() {}
}
