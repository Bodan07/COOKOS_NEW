import 'package:flutter/foundation.dart';

import 'User.dart';
import 'package:provider/provider.dart';

class Profile extends ChangeNotifier {
  String id_user;
  String nama;
  int usia;
  String jenis_Kelamin;
  String tanggal_lahir;
  //String image;

  void setid(String uid) {
    this.id_user = id_user;
  }

  Profile(
      {this.id_user = "",
      this.nama = "",
      this.usia = 0,
      this.jenis_Kelamin = "",
      this.tanggal_lahir = ""});

  void changeProfile(
      {required String n,
      required int u,
      required String jk,
      required String tl}) async {
    nama = n;
    usia = u;
    jenis_Kelamin = jk;
    tanggal_lahir = tl;
    notifyListeners();
  }
}
