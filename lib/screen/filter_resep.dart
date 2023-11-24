import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/model/Resep.dart';
import 'package:flutter_dev/model/filter_resep.dart';
import 'package:flutter_dev/screen/edit_profile.dart';
import 'package:flutter_dev/screen/homepage.dart';

class filterResep extends StatefulWidget {
  const filterResep({super.key});

  @override
  State<filterResep> createState() => _filterResepState();
}

class _filterResepState extends State<filterResep> {
  List<Resep> result = [];

  TextEditingController cariresepController = TextEditingController();
  TextEditingController harga1Controller = TextEditingController();
  TextEditingController harga2Controller = TextEditingController();
  TextEditingController harga3Controller = TextEditingController();
  TextEditingController harga4Controller = TextEditingController();
  TextEditingController harga5Controller = TextEditingController();
  TextEditingController harga6Controller = TextEditingController();
  TextEditingController harga7Controller = TextEditingController();
  TextEditingController harga8Controller = TextEditingController();

  void search(String value) async {
    var data = await FirebaseFirestore.instance.collection('resep').get();
    setState(() {
      List<Resep> resep =
          List.from(data.docs.map((doc) => Resep.fromSnapshot(doc)));
      result = resep
          .where((element) =>
              element.Nama_Masakan!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void _harga1() {
    String harga1 = harga1Controller.text;
  }

  void _harga2() {
    String harga2 = harga2Controller.text;
  }

  void _harga3() {
    String harga3 = harga3Controller.text;
  }

  void _harga4() {
    String harga4 = harga4Controller.text;
  }

  void _harga5() {
    String harga5 = harga5Controller.text;
  }

  void _harga6() {
    String harga6 = harga6Controller.text;
  }

  void _harga7() {
    String harga7 = harga7Controller.text;
  }

  void _harga8() {
    String harga8 = harga8Controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Color.fromARGB(255, 255, 255, 255),
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => homepage()));
          },
        ),
        backgroundColor: Color(0xffe5737d),
        centerTitle: true,
        title: Text(
          'Mencari Resep',
          style: TextStyle(
              color: Color.fromRGBO(236, 236, 236, 1),
              fontFamily: 'Rubik',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          (Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(50, 0, 0, 0), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 6),
                          child: Icon(
                            Icons.search,
                            color: Color(0xFFD9D9D9),
                          ),
                        ),
                        Container(
                            width: 250,
                            height: 50,
                            child: TextFormField(
                              onChanged: (value) => search(value),
                              decoration: InputDecoration(
                                hintText: 'eg : Baso Ikan',
                                hintStyle: TextStyle(
                                  color: Color(0xFFD9D9D9),
                                  fontFamily: 'Rubik',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                              ),
                            ))
                      ],
                    ),
                  ),
                  //========container logo filter resep (pink)
                  Container(
                    height: 50,
                    width: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              )),
                              builder: (BuildContext context) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 8),
                                  height: 250,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25.0),
                                    ),
                                    color: Color(0xFFE9E9E9),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 10),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 7),
                                                child: Text(
                                                  'Harga',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            //Row harga
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                // container harga1
                                                Column(
                                                  children: [
                                                    Container(
                                                        width: 141,
                                                        height: 30,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 25,
                                                                vertical: 10),
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              _harga1();
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              child: Text(
                                                                'Rp.8000 - Rp15.Rb',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        13,
                                                                    color: Color(
                                                                        0xff393939)),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              shadowColor:
                                                                  Colors.black,
                                                              primary: Color(
                                                                  0xffFDFDFD), // Set the shadow color
                                                              elevation:
                                                                  5, // Adjust the elevation to control the shadow intensity
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              minimumSize:
                                                                  Size(150, 40),
                                                            ))),
                                                    //container harga 3
                                                    Container(
                                                        width: 141,
                                                        height: 30,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5,
                                                                vertical: 10),
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              _harga3();
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              child: Text(
                                                                'Rp.30rb - Rp15Rb',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        13,
                                                                    color: Color(
                                                                        0xff393939)),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              shadowColor:
                                                                  Colors.black,
                                                              primary: Color(
                                                                  0xffFDFDFD), // Set the shadow color
                                                              elevation:
                                                                  5, // Adjust the elevation to control the shadow intensity
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              minimumSize:
                                                                  Size(150, 40),
                                                            ))),
                                                    Container(
                                                        width: 141,
                                                        height: 30,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5,
                                                                vertical: 10),
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              _harga5();
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              child: Text(
                                                                'Rp.50rb - Rp59Rb',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        13,
                                                                    color: Color(
                                                                        0xff393939)),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              shadowColor:
                                                                  Colors.black,
                                                              primary: Color(
                                                                  0xffFDFDFD), // Set the shadow color
                                                              elevation:
                                                                  5, // Adjust the elevation to control the shadow intensity
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              minimumSize:
                                                                  Size(150, 40),
                                                            ))),
                                                    Container(
                                                        width: 141,
                                                        height: 30,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5,
                                                                vertical: 10),
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              _harga7();
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              child: Text(
                                                                'Rp.70rb - Rp79Rb',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        13,
                                                                    color: Color(
                                                                        0xff393939)),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              shadowColor:
                                                                  Colors.black,
                                                              primary: Color(
                                                                  0xffFDFDFD), // Set the shadow color
                                                              elevation:
                                                                  5, // Adjust the elevation to control the shadow intensity
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              minimumSize:
                                                                  Size(150, 40),
                                                            ))),
                                                  ],
                                                ),
                                                // ROW 2
                                                Column(
                                                  children: [
                                                    // container harga 2
                                                    Container(
                                                        width: 141,
                                                        height: 30,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 19,
                                                                vertical: 10),
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              _harga2();
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          6),
                                                              child: Text(
                                                                'Rp.15 rb - Rp29 Rb',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        13,
                                                                    color: Color(
                                                                        0xff393939)),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              shadowColor:
                                                                  Colors.black,
                                                              primary: Color(
                                                                  0xffFDFDFD), // Set the shadow color
                                                              elevation:
                                                                  5, // Adjust the elevation to control the shadow intensity
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              minimumSize:
                                                                  Size(150, 40),
                                                            ))),
                                                    Container(
                                                        width: 141,
                                                        height: 30,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 19,
                                                                vertical: 10),
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              _harga4();
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          6),
                                                              child: Text(
                                                                'Rp.40 rb - Rp49 Rb',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        13,
                                                                    color: Color(
                                                                        0xff393939)),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              shadowColor:
                                                                  Colors.black,
                                                              primary: Color(
                                                                  0xffFDFDFD), // Set the shadow color
                                                              elevation:
                                                                  5, // Adjust the elevation to control the shadow intensity
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              minimumSize:
                                                                  Size(150, 40),
                                                            ))),
                                                    Container(
                                                        width: 141,
                                                        height: 30,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 19,
                                                                vertical: 10),
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              _harga6();
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          6),
                                                              child: Text(
                                                                'Rp.60 rb - Rp69 Rb',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        13,
                                                                    color: Color(
                                                                        0xff393939)),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              shadowColor:
                                                                  Colors.black,
                                                              primary: Color(
                                                                  0xffFDFDFD), // Set the shadow color
                                                              elevation:
                                                                  5, // Adjust the elevation to control the shadow intensity
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              minimumSize:
                                                                  Size(150, 40),
                                                            ))),
                                                    Container(
                                                        width: 141,
                                                        height: 30,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 19,
                                                                vertical: 10),
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              _harga8();
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          6),
                                                              child: Text(
                                                                '> Rp 80 Rb',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        13,
                                                                    color: Color(
                                                                        0xff393939)),
                                                              ),
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              shadowColor:
                                                                  Colors.black,
                                                              primary: Color(
                                                                  0xffFDFDFD), // Set the shadow color
                                                              elevation:
                                                                  5, // Adjust the elevation to control the shadow intensity
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              minimumSize:
                                                                  Size(150, 40),
                                                            ))),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffe5737d),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Container(
                          child: Image.asset('assets/images/filter.png'),
                        )),
                  ),
                ],
              ),
            ],
          )),
          //buat list view builder filter resep
          Expanded(
            child: result.length == 0
                ? Center(
                    child: Text(
                      "Resep Tidak Ada",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff393939)),
                    ),
                  )
                : ListView.builder(
                    itemCount: result.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.only(top: 3.0, left: 10),
                            title: Text(
                              result[index].Nama_Masakan,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff393939)),
                            ),
                            subtitle: Text(
                              result[index].Deskripsi_Masakan,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff393939)),
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                result[index].bintang.toString(),
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff393939)),
                              ),
                            ),
                            leading: Container(
                              width: 130,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(result[index].image),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        )),
          )
        ],
      ),
    ));
  }
}
