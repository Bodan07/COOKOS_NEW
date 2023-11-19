import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
    this.id_user = uid;
  }

  Profile(
      {this.id_user = "",
      this.nama = "",
      this.usia = 0,
      this.jenis_Kelamin = "",
      this.tanggal_lahir = "",
      this.image =
          "https://firebasestorage.googleapis.com/v0/b/cookos.appspot.com/o/image%2F1659338800000.jpg?alt=media&token=14112183-de2a-4048-b7bc-760561de3c79"});

  void changeProfile(
      {required String n,
      required int u,
      required String jk,
      required String tl,
      required String img}) async {
    final docprofile = FirebaseFirestore.instance.collection('profile');
    this.nama = n;
    this.usia = u;
    this.jenis_Kelamin = jk;
    this.tanggal_lahir = tl;
    this.image = img;
    final data = {
      'nama': n,
      'usia': u,
      'jenis_Kelamin': jk,
      'tanggal_lahir': tl,
      'image': img,
    };
    await docprofile.doc(id_user).update(data);
    notifyListeners();
  }

  void setuser(String uid) {
    this.id_user = uid;
  }

  void fetchprofile() async {
    try {
      final docprofile = FirebaseFirestore.instance.collection('profile');
      var doc = await docprofile.doc(id_user).get();

      if (doc.exists) {
        Map<String, dynamic> data = doc.data()!;
        this.nama = data['nama'];
        this.usia = data['usia'];
        this.jenis_Kelamin = data['jenis_Kelamin'];
        this.tanggal_lahir = data['tanggal_lahir'];
        this.image = data['image'];
        notifyListeners();
      }
    } on FirebaseException catch (error) {
      print(error);
    }
  }

  void createprofile(String uid) async {
    try {
      final docprofile = FirebaseFirestore.instance.collection('profile');
      final data = {
        'nama': this.nama,
        'usia': this.usia,
        'jenis_Kelamin': this.jenis_Kelamin,
        'tanggal_lahir': this.tanggal_lahir,
        'image': this.image,
      };
      await docprofile.doc(uid).set(data);
    } on FirebaseException catch (error) {
      print(error);
    }
  }
}
