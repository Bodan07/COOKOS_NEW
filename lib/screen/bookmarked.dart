import 'package:flutter/material.dart';
//import 'package:flutter_dev/screen/bokmarked_2.dart';
import 'package:flutter_dev/screen/homepage.dart';

class bookmarked extends StatefulWidget {
  const bookmarked({super.key});

  @override
  State<bookmarked> createState() => _bookmarkedState();
}

class _bookmarkedState extends State<bookmarked> {
  bool isBookmarked = false;

  void menujuRating(){
    Navigator.pushNamed(context, '/rating_review');
  }
  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                                Container(margin: EdgeInsets.only(left: 20),
                                  child: Text("Udang Goreng Asam",      //diisi nama resep
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),)),
                                Container(
                                margin: EdgeInsets.only(left: 20, bottom: 20),
                                child: Text('Rinrin Marinka',  //disi nama uploader
                                  style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Colors.white
                              ),),
                            )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                              Container(
                                margin: EdgeInsets.only(right: 15, bottom: 15),
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.bookmark,
                                  color: Colors.white,
                                  size: 30,
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
                        offset: Offset(0, 4), // Horizontal and vertical offset of the shadow
                        blurRadius: 6, // Spread of the shadow
                        spreadRadius: 0, // Positive value will expand the shadow, negative value will shrink it
                      ),
                    ],
                    ),
                  ),
                  Container(
                    height: 260,
                    child: Image.asset('assets/images/udang.png', fit: BoxFit.cover,) //Diisi gambar resep database
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 10, top: 20),
                    height: 100,
                    child : IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                      onPressed: () {
                        homepage();
                      },
                      iconSize: 30,),
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
                      children: [
                        Container(
                          height: 40,
                          width: 350,
                          child: Container(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            child: Text('Bahan - bahan',style: TextStyle(
                              fontFamily: 'Nuito Sans',
                              fontWeight: FontWeight.bold
                            ),)),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Color.fromARGB(50, 0, 0, 0), width: 2)
                            )
                          ),
                        ),
                      Container(child: Text('isi')) //isi dari database

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
                            child: Text('Cara Memasak',style: TextStyle(
                              fontFamily: 'Nuito Sans',
                              fontWeight: FontWeight.bold
                            ),)),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Color.fromARGB(50, 0, 0, 0), width: 2)
                            )
                          ),
                        ),
                      Container(child: Text('isi')) //isi dari database
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(70, 0, 0, 0), width: 2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  //=================================Resep Telah di tambahkan============================================
                  Container(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 212,
                              height: 155,
                              decoration: BoxDecoration(
                                color: Color(0xFFECECEC),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 55),
                                width: 212,
                                height: 148,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE5737D),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey, // Shadow color
                                      offset: Offset(0, 3), // Offset (x, y)
                                      blurRadius: 5, // Spread radius
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      //alignment: Alignment.bottomCenter,
                                      child: Text(
                                      "Resep telah ditambahkan ke Bookmark",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Color(0xFFFFFFFF),
                                        shadows: [
                                          Shadow(
                                            color:Color.fromARGB(255, 155, 154, 154), // Shadow color
                                            offset: Offset(0, 1), // Offset (x, y)
                                            blurRadius: 6, // Spread radius
                                          )
                                        ]
                                      ),
                                      textAlign: TextAlign.center,),
                                    )
                                  ],
                                )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 110,left: 160),
                              height: 28,
                              width: 48,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.popAndPushNamed(context, "/bookmarked_2");
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFFECECEC),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  )
                                ),
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Color(0xFFE5737D),
                                  ),
                                  //textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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