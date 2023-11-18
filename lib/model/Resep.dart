import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'User.dart';
import 'package:provider/provider.dart';

class Resep extends ChangeNotifier {
  String id;
  String Nama_Masakan;
  String Deskripsi_Masakan;
  String Cara_Membuat;
  String Bahan;
  int Budget;
  String image;
  bool Verifikasi;
  double bintang;
  int enak;
  int praktis;
  int murah;

  Resep(
      {this.id = "",
      this.Nama_Masakan = "",
      this.Budget = 0,
      this.Cara_Membuat = "",
      this.Deskripsi_Masakan = "",
      this.Bahan = "",
      this.image = "",
      this.Verifikasi = false,
      this.bintang = 0,
      this.enak = 0,
      this.murah = 0,
      this.praktis = 0});
  Future uploadResep(
      {required String judul,
      required int harga,
      required String bahan,
      required String cara,
      required String uid,
      required String image}) async {
    try {
      final docprofile = FirebaseFirestore.instance.collection('resep');
      final data = {
        'bahan': bahan,
        'harga': harga,
        'cara_membuat': cara,
        'pembuat': uid,
        'judul': judul,
        'verifikasi': false,
        'bintang': 0.0,
        'enak': 0,
        'murah': 0,
        'praktis': 0,
        'image': image
      };
      await docprofile.add(data);
      notifyListeners();
      return "Resep Berhasil Ditambahkan, Tunggu Sampai Diverifikasi";
    } on FirebaseException catch (error) {
      return error.toString();
    }
  }
}

var listr = [
  Resep(
      id: "1",
      Nama_Masakan: "Ayam Pop",
      Budget: 20000,
      Cara_Membuat: "cara",
      Deskripsi_Masakan: "Deskripsi_Masakan",
      Bahan: "bahan",
      image: "assets/images/udang.png",
      Verifikasi: true,
      bintang: 4.7,
      murah: 2,
      enak: 4,
      praktis: 2),
  Resep(
      id: "2",
      Nama_Masakan: "Nasi Goreng",
      Budget: 7000,
      Cara_Membuat: "hmmm",
      Deskripsi_Masakan: "Deskripsi_Masakan",
      Bahan: "bahan",
      image: "assets/images/udang.png",
      Verifikasi: true,
      bintang: 5,
      murah: 2,
      enak: 4,
      praktis: 2),
  Resep(
      id: "2",
      Nama_Masakan: "Ayam goreng",
      Budget: 5000,
      Cara_Membuat: "Cara_Membuat",
      Deskripsi_Masakan: "Deskripsi_Masakan",
      Bahan: "bahan",
      image: "assets/images/udang.png",
      Verifikasi: false,
      bintang: 3,
      murah: 2,
      enak: 4,
      praktis: 2)
];
