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
          "https://firebasestorage.googleapis.com/v0/b/cookos.appspot.com/o/image%2FScreenshot%20(291).png?alt=media&token=120a66f2-289b-4e72-b9f3-96cdce912fdf&_gl=1*195f8g5*_ga*ODQ0MDM0ODY0LjE2OTcxODU0MDE.*_ga_CW55HF8NVT*MTY5OTI5NDI4NS4xNi4xLjE2OTkyOTczMjcuMzkuMC4w"});

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
