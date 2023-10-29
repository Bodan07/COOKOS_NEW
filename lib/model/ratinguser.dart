import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class RatingUser extends ChangeNotifier {
  String id_resep;
  double bintang;
  String nama;
  String komentar;

  RatingUser(
      {required this.id_resep,
      required this.bintang,
      required this.komentar,
      required this.nama});
}

List<RatingUser> ratingusers = [
  RatingUser(id_resep: "1", bintang: 4, komentar: "komentar", nama: "W**y"),
  RatingUser(id_resep: "1", bintang: 4, komentar: "komentar", nama: "W**y"),
  RatingUser(id_resep: "1", bintang: 4, komentar: "komentar", nama: "W**y"),
];
