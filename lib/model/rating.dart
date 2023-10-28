

class rating {
  int enak;
  int praktis;
  int murah;
  List<int> bintang;
  String komentar;
  String penulis;

  rating(
      {required this.enak,
      required this.praktis,
      required this.murah,
      required this.bintang,
      required this.komentar,required this.penulis});
}

rating rate = rating(enak: 1, praktis: 0, murah: 1, bintang: [4,5,3], komentar: komentar)
