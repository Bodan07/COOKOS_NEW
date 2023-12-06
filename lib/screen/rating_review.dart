import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev/model/Profile.dart';
import 'package:flutter_dev/model/RatingUser.dart';
import 'package:flutter_dev/model/Resep.dart';
import 'package:flutter_dev/screen/meilhat_resep.dart';
import 'package:flutter_dev/widget/toggleButton.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_dev/widget/ShowRatingStars.dart';
import 'package:flutter_dev/widget/RatingStars.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RatingPage extends StatefulWidget {
  Resep iniresep;
  RatingPage({Key? key, required this.iniresep}) : super(key: key);

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  TextEditingController reviewController =
      TextEditingController(text: 'Resepnya praktis banget!');
  int ratingFromRatingStars = 0;
  int enak = 0;
  int murah = 0;
  int praktis = 0;
  List<RatingUser> listrating = [];

  @override
  void initState() {
    super.initState();
    context.read<Resep>().fetchresep(widget.iniresep.id);
    fetchrating();
  }

  void fetchrating() async {
    final ratingreviewcollection =
        FirebaseFirestore.instance.collection('ratingreview');
    var data = await ratingreviewcollection
        .where("id_resep", isEqualTo: widget.iniresep.id)
        .get();
    setState(() {
      listrating =
          List.from(data.docs.map((doc) => RatingUser.fromSnapshot(doc)));
    });
  }

  void handleRatingChange(int newRating) {
    setState(() {
      ratingFromRatingStars = newRating;
    });
  }

  void enakChange(int satu) {
    enak = satu;
  }

  void murahChange(int dua) {
    murah = dua;
  }

  void praktisChange(int tiga) {
    praktis = tiga;
  }

  void _kirim() async {
    String review = reviewController.text;
    print(ratingFromRatingStars); // kirim ke database;
    print(enak); //kirim database
    print(murah); //kirim database
    print(praktis); //kirim database

    try {
      final docrating = FirebaseFirestore.instance.collection('ratingreview');
      final data = {
        'id_resep': widget.iniresep.id,
        'bintang': ratingFromRatingStars,
        'nama': context.read<Profile>().nama,
        'komentar': review
      };
      await docrating.add(data);

      context.read<Resep>().updaterating(
          widget.iniresep.id, ratingFromRatingStars, enak, praktis, murah);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return RatingPage(iniresep: widget.iniresep);
      }));
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe5737d),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Rating dan Review',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Rubik',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffe5737d), Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 350,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(50, 0, 0, 0), width: 2.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        )),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //===============Hasil Rating(input dtbs)===============
                        Container(
                          margin: EdgeInsets.only(left: 22, top: 12),
                          child: Column(
                            children: [
                              Text(
                                ((context.watch<Resep>().bintang /
                                            listrating.length.toDouble())
                                        .toStringAsFixed(1))
                                    .toString(),
                                style: TextStyle(
                                  fontFamily: 'Nuito Sans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                              ),
                              Container(
                                child: Text(
                                    listrating.length.toString() + ' rating'),
                              )
                            ],
                          ),
                        ),
                        //=========================RATING BINTANG DR DTBS==========================
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: ShowRatingStars(
                              rating: context.watch<Resep>().bintang /
                                  listrating.length
                                      .toDouble()), //angka diubah dari database
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //======================container berisi row rasa enak, bahan murah, etc============================
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //container berisi makanan enak
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          height: 120,
                          width: 100,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.asset(
                                    "assets/images/enak.png",
                                    height: 70,
                                    width: 70,
                                  ),
                                ),
                                Text(
                                  'Rasa Enak',
                                  style: TextStyle(
                                      fontFamily: 'Nuito Sans',
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(context.watch<Resep>().enak.toString() +
                                    ' rating') // diisi dari databasse
                              ]),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(239, 110, 17, 83),
                              border: Border.all(
                                  color: Color.fromARGB(49, 255, 255, 255),
                                  width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                        ),
                        Container(
                          //container berisi makanan enak
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          height: 120,
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/images/murah.png',
                                  height: 70,
                                  width: 70,
                                ),
                              ),
                              Text(
                                'Harga Murah',
                                style: TextStyle(
                                  fontFamily: 'Nuito Sans',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(context.watch<Resep>().murah.toString() +
                                  ' rating'), //diisi database
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 237, 70, 100),
                              border: Border.all(
                                  color: Color.fromARGB(50, 0, 0, 0),
                                  width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                        ),
                        Container(
                          //container berisi makanan enak
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          height: 120,
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/images/praktis.png',
                                  height: 70,
                                  width: 70,
                                ),
                              ),
                              Text(
                                'Praktis',
                                style: TextStyle(
                                    fontFamily: 'Nuito Sans',
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(context.watch<Resep>().praktis.toString() +
                                  ' rating'), //diisi database
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(44, 177, 219, 56),
                              border: Border.all(
                                  color: Color.fromARGB(50, 0, 0, 0),
                                  width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20),
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(50, 0, 0, 0), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Column(
                      children: [
                        Container(
                          //Container tambahkan rating(bintang)
                          height: 45,
                          width: 350,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 20),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Tambahkan Rating Anda',
                                    style: TextStyle(
                                      fontFamily: 'Nuito Sans',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: RatingStars(
                                      onRatingChanged: handleRatingChange)),
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromARGB(50, 0, 0, 0),
                                      width: 2.0))),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 90,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromARGB(50, 0, 0, 0),
                                      width: 2.0))),
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Apa yang Kamu Suka dari Resepnya?',
                                    style: TextStyle(
                                        fontFamily: 'Nuito Sans',
                                        fontWeight: FontWeight.bold),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 90,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: ToggleButtonExample(
                                          text1: "ENAK!!",
                                          text2: "Rasa",
                                          onSavedValueChanged: enakChange)),
                                  Container(
                                      width: 90,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: ToggleButtonExample(
                                          text1: "MURAH!!",
                                          text2: "Harga",
                                          onSavedValueChanged: murahChange)),
                                  Container(
                                      width: 110,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: ToggleButtonExample(
                                          text1: "PRAKTIS!!",
                                          text2: "Langkah",
                                          onSavedValueChanged: praktisChange))
                                ],
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                alignment: Alignment.center,
                                child: Text(
                                  'Tambahkan Pengalamanmu',
                                  style: TextStyle(
                                      fontFamily: 'Nuito Sans',
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                                //text box pengalaman
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                //height: 140,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextField(
                                  controller: reviewController,
                                  maxLength: 1000,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                      fillColor: Color.fromARGB(25, 0, 0, 0),
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                )),
                            Container(
                              width: 110,
                              margin: EdgeInsets.only(right: 30),
                              child: ElevatedButton(
                                onPressed: _kirim,
                                child: Row(
                                  children: [
                                    Container(child: Text('Kirim')),
                                    Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Icon(Icons.arrow_forward))
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(
                                      0xffe5737d), // Ubah warna latar belakang
                                  onPrimary: Colors.white, // Ubah warna teks
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  minimumSize: Size(150, 40),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "Ulasan Pengguna " + listrating.length.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: listrating.length,
                  itemBuilder: (context, index) {
                    if (index <= listrating.length) {
                      final iniratings = listrating[index];
                      return ratingWidget(inirating: iniratings);
                    }
                  }),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffe5737d), Colors.white],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter)),
            ),
          ],
        ),
      ),
    );
  }
}

class ratingWidget extends StatelessWidget {
  final RatingUser inirating;
  const ratingWidget({
    Key? key,
    required this.inirating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 63,
          width: 350,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            border: Border.all(color: Color.fromARGB(70, 0, 0, 0), width: 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.account_box_rounded,
                      size: 40,
                      color: const Color.fromARGB(255, 234, 120, 158),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      inirating.nama,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              ShowRatingStars(rating: inirating.bintang.toDouble())
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          height: 63,
          width: 350,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            border: Border.all(color: Color.fromARGB(70, 0, 0, 0), width: 1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Center(
            child: Text(inirating.komentar,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                )),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
