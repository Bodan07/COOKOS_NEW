class Resep {
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
      {required this.id,
      required this.Nama_Masakan,
      required this.Budget,
      required this.Cara_Membuat,
      required this.Deskripsi_Masakan,
      required this.Bahan,
      required this.image,
      required this.Verifikasi,
      required this.bintang,
      required this.enak,
      required this.murah,
      required this.praktis});
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
      id: "1",
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
      id: "1",
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
