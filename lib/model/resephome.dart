class Resep {
  String Nama_Masakan;
  String Deskripsi_Masakan;
  String Cara_Membuat;
  int Budget;
  String image;
  bool Verifikasi;

  Resep(
      {required this.Nama_Masakan,
      required this.Budget,
      required this.Cara_Membuat,
      required this.Deskripsi_Masakan,
      required this.image,
      required this.Verifikasi});
}

var listr = [
  Resep(
      Nama_Masakan: "Ayam Pop",
      Budget: 20000,
      Cara_Membuat: "cara",
      Deskripsi_Masakan: "Deskripsi_Masakan",
      image: "assets/images/test1.png",
      Verifikasi: true),
  Resep(
      Nama_Masakan: "Nasi Goreng",
      Budget: 7000,
      Cara_Membuat: "hmmm",
      Deskripsi_Masakan: "Deskripsi_Masakan",
      image: "assets/images/test1.png",
      Verifikasi: true),
  Resep(
      Nama_Masakan: "Ayam goreng",
      Budget: 5000,
      Cara_Membuat: "Cara_Membuat",
      Deskripsi_Masakan: "Deskripsi_Masakan",
      image: "assets/images/test1.png",
      Verifikasi: false)
];
