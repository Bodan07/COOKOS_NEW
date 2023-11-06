import 'package:flutter/material.dart';
import 'package:flutter_dev/model/Resep.dart';

class melihatResep extends StatefulWidget {
  final Resep iniresep;
  const melihatResep({Key? key, required this.iniresep}) : super(key: key);

  @override
  State<melihatResep> createState() => _melihatResepState();
}

class _melihatResepState extends State<melihatResep> {
  bool isBookmarked = false;

  void menujuRating() {
    Navigator.pushNamed(context, '/rating_review');
  }

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
      if (isBookmarked) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Resep berhasil di tambahkan ke bookmark"),
          behavior: SnackBarBehavior.floating,
        ));
      }
    });
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
                    height: 370,
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
                                  margin: EdgeInsets.only(
                                      left: 20, top: 5, bottom: 5),
                                  child: Text(
                                    'Rinrin Marinka', //disi nama uploader
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, bottom: 20),
                                  height: 30,
                                  width: 60,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          widget.iniresep.bintang.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Color.fromARGB(10, 0, 0, 0),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(15)),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(right: 20, bottom: 10),
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    icon: isBookmarked
                                        ? Icon(Icons.bookmark_outlined)
                                        : Icon(Icons.bookmark_border_rounded),
                                    color: Colors.white,
                                    iconSize: 40,
                                    onPressed: toggleBookmark,
                                  ),
                                ),
                              ],
                            )
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
                      child: Image.asset(
                        widget.iniresep.image,
                        fit: BoxFit.cover,
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
                        Navigator.pushNamed(context, '/homepage');
                      },
                      iconSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: 350,
                  constraints: BoxConstraints(maxHeight: double.infinity),
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
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
                          child: Text(
                              widget.iniresep.Cara_Membuat)) //isi dari database
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text(
                            'Rp 60.000,-',
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
                Container(
                  height: 50,
                  width: 350,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: ElevatedButton(
                      onPressed: menujuRating,
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text('Tambahkan Rating'),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Row(
                                children: List.generate(5, (index) {
                                  return Icon(Icons.star_border_outlined,
                                      color: Colors.amber);
                                }),
                              ))
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
