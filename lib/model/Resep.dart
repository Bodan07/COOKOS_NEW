import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'user.dart';
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

  Map<String, dynamic> toJson() => {
        'bahan': Bahan,
        'bintang': bintang,
        'cara_membuat': Cara_Membuat,
        'enak': enak,
        'harga': Budget,
        'image': image,
        'judul': Nama_Masakan,
        'murah': murah,
        'pembuat': Deskripsi_Masakan,
        'praktis': praktis,
        'verifikasi': Verifikasi
      };
  Resep.fromSnapshot(snapshot)
      : id = snapshot.id,
        Nama_Masakan = snapshot.data()['judul'],
        Budget = snapshot.data()['harga'],
        Cara_Membuat = snapshot.data()['cara_membuat'],
        Deskripsi_Masakan = snapshot.data()['pembuat'],
        Bahan = snapshot.data()['bahan'],
        image = snapshot.data()['image'],
        Verifikasi = snapshot.data()['verifikasi'],
        bintang = snapshot.data()['bintang'].toDouble(),
        enak = snapshot.data()['enak'],
        murah = snapshot.data()['murah'],
        praktis = snapshot.data()['praktis'];

  Future uploadResep(
      {required String judul,
      required int harga,
      required String bahan,
      required String cara,
      required String uid,
      required String image}) async {
    try {
      final docresep = FirebaseFirestore.instance.collection('resep');

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

      await docresep.add(data);
      notifyListeners();
      return "Resep Berhasil Ditambahkan, Tunggu Sampai Diverifikasi";
    } on FirebaseException catch (error) {
      return error.toString();
    }
  }

  void updaterating(
      String id_resep, int bintang, int enak, int praktis, int murah) async {
    final collectionresep = FirebaseFirestore.instance.collection('resep');
    double dbbintang;
    int dbenak;
    int dbmurah;
    int dbpraktis;

    var doc = await collectionresep.doc(id_resep).get();

    if (doc.exists) {
      Map<String, dynamic> data = doc.data()!;
      dbbintang = data['bintang'].toDouble();
      dbenak = data['enak'];
      dbmurah = data['murah'];
      dbpraktis = data['praktis'];

      final updata = {
        'bintang': bintang.toDouble() + dbbintang,
        'enak': enak + dbenak,
        'praktis': praktis + dbpraktis,
        'murah': murah + dbmurah,
      };
      await collectionresep.doc(id_resep).update(updata);
      this.bintang = bintang.toDouble() + dbbintang;
      this.enak = enak + dbenak;
      this.praktis = praktis + dbpraktis;
      this.murah = murah + dbmurah;
      notifyListeners();
    }
  }

  void fetchresep(String id_resep) async {
    try {
      final docprofile = FirebaseFirestore.instance.collection('resep');
      var doc = await docprofile.doc(id_resep).get();

      if (doc.exists) {
        Map<String, dynamic> data = doc.data()!;
        this.Nama_Masakan = data['judul'];
        this.Cara_Membuat = data['cara_membuat'];
        this.Deskripsi_Masakan = data['pembuat'];
        this.Bahan = data['bahan'];
        this.image = data['image'];
        this.Verifikasi = data['verifikasi'];
        this.bintang = data['bintang'].toDouble();
        this.enak = data['enak'];
        this.murah = data['murah'];
        this.praktis = data['praktis'];
        notifyListeners();
      }
    } catch (error) {
      print(error);
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
