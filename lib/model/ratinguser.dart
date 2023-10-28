class ratinguser {
  double bintang;
  String nama;
  String komentar;

  ratinguser(
      {required this.bintang, required this.komentar, required this.nama});
}

List<ratinguser> ratingusers = [
  ratinguser(bintang: 4, komentar: "komentar", nama: "W**y"),
  ratinguser(bintang: 4, komentar: "komentar", nama: "W**y"),
  ratinguser(bintang: 4, komentar: "komentar", nama: "W**y"),
];
