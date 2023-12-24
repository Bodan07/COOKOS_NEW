import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/model/Resep.dart';
import 'package:flutter_dev/screen/homepage.dart';

class melihatResepSenior extends StatefulWidget {
  Resep iniresep;
  melihatResepSenior({Key? key, required this.iniresep}) : super(key: key);

  @override
  State<melihatResepSenior> createState() => _melihatResepSeniorState();
}

class _melihatResepSeniorState extends State<melihatResepSenior> {
  bool isBookmarked = false;

  void _verificate() async {
    final ResepCollection =
        FirebaseFirestore.instance.collection('resep').doc(widget.iniresep.id);
    ResepCollection.update({'verifikasi': true});
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 330,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      widget.iniresep
                                          .Nama_Masakan, //diisi nama resep
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(left: 20, bottom: 20),
                                  child: Text(
                                    widget.iniresep
                                        .Deskripsi_Masakan, //disi nama uploader
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                child: Text(
                                  'Verificate',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                onPressed: _verificate,
                                style: ElevatedButton.styleFrom(
                                  primary: const Color.fromARGB(255, 255, 255,
                                      255), // Ubah warna latar belakang
                                  onPrimary:
                                      Color(0xffe5737d), // Ubah warna teks
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  minimumSize: Size(100, 40),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffe5737d),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0,
                              4), // Horizontal and vertical offset of the shadow
                          blurRadius: 6, // Spread of the shadow
                          spreadRadius:
                              0, // Positive value will expand the shadow, negative value will shrink it
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 260,
                      width: double.infinity,
                      child: Image.network(
                        widget.iniresep.image,
                        fit: BoxFit.fill,
                      ) //Diisi gambar resep database
                      ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 10, top: 20),
                    height: 100,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context, "");
                      },
                      iconSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 350,
                    constraints: BoxConstraints(maxHeight: double.infinity),
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 350,
                          child: Container(
                              padding: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                'Bahan - bahan',
                                style: TextStyle(
                                    fontFamily: 'Nuito Sans',
                                    fontWeight: FontWeight.bold),
                              )),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromARGB(50, 0, 0, 0),
                                      width: 2))),
                        ),
                        Container(
                            padding: EdgeInsets.all(15),
                            child:
                                Text(widget.iniresep.Bahan)) //isi dari database
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(70, 0, 0, 0), width: 2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Container(
                    width: 350,
                    constraints: BoxConstraints(maxHeight: double.infinity),
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 350,
                          child: Container(
                              padding: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                'Cara Memasak',
                                style: TextStyle(
                                    fontFamily: 'Nuito Sans',
                                    fontWeight: FontWeight.bold),
                              )),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromARGB(50, 0, 0, 0),
                                      width: 2))),
                        ),
                        Container(
                            padding: EdgeInsets.all(15),
                            child: Text(widget
                                .iniresep.Cara_Membuat)) //isi dari database
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(70, 0, 0, 0), width: 2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Container(
                                child: Image.asset('assets/images/money.png'),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    'Estimasi Harga',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Text(
                              'Rp ' + widget.iniresep.Budget.toString() + ',-',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(70, 0, 0, 0), width: 2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
