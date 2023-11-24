import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev/model/Resep.dart';
import 'package:flutter_dev/screen/registrasi.dart';
import 'RatingUser.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class user extends ChangeNotifier {
  String id_user;
  String username;
  String email;
  String tipe_user;
  List<Resep> bookmark = [];

  user({
    this.id_user = "",
    this.username = "",
    this.email = "",
    this.tipe_user = "",
  });

  String getid() {
    return id_user;
  }

  List<Resep> getbookmark() {
    return bookmark;
  }

  void addbookmark(Resep r) {
    final userdoc = FirebaseFirestore.instance.collection('user').doc(id_user);
    final resepdoc = FirebaseFirestore.instance.collection('resep').doc(r.id);
    userdoc.update({
      "bookmark": FieldValue.arrayUnion([resepdoc])
    });

    bookmark.add(r);
  }

  void removebookmark(Resep r) {
    final userdoc = FirebaseFirestore.instance.collection('user').doc(id_user);
    final resepdoc = FirebaseFirestore.instance.collection('resep').doc(r.id);
    userdoc.update({
      "bookmark": FieldValue.arrayRemove([resepdoc])
    });

    bookmark.remove(r);
  }

  void fetchbookmark(String id) async {
    List<dynamic> bookmarktemp = [];
    final usercollection = FirebaseFirestore.instance.collection('user');
    var doc = await usercollection.doc(id).get();
    if (doc.exists) {
      Map<String, dynamic> data = doc.data()!;
      bookmarktemp = data['bookmark'];
      print(bookmarktemp);

      if (bookmarktemp.isEmpty) {
        bookmark = [];
        notifyListeners();
      } else {
        final resepcollection = FirebaseFirestore.instance.collection('resep');
        QuerySnapshot resepsnapshot = await resepcollection
            .where(FieldPath.documentId, whereIn: bookmarktemp)
            .get();

        bookmark =
            List.from(resepsnapshot.docs.map((doc) => Resep.fromSnapshot(doc)));
        notifyListeners();
      }
    }
  }

  void fetchuser(String id) async {
    try {
      final docuser = FirebaseFirestore.instance.collection('user');
      var doc = await docuser.doc(id).get();

      if (doc.exists) {
        Map<String, dynamic> data = doc.data()!;
        this.id_user = id;
        this.username = data['username'];
        this.email = data['email'];
        this.tipe_user = data['tipe_user'];
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }
}
