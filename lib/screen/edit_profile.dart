//import 'dart:html';

import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfile();
}

  class _EditProfile extends State<EditProfile> {
  TextEditingController updateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usiaController = TextEditingController();
  TextEditingController jeniskelaminController = TextEditingController();
  TextEditingController tanggallahirController = TextEditingController();

  void _Update(){
    String update = updateController.text;
    String usia = usiaController.text;
    String jeniskelamin = jeniskelaminController.text;
    String tanggallahir = tanggallahirController.text;
    Navigator.pushNamed(context, "/Melihat_profile");
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Profil",
          style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Rubik',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xffe5737d),
          centerTitle: true,
        ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                      color: const Color(0xffe5737d),
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
                      ),
                      child: (Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            width: 150,
                            height: 150,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )),
                    ),
                  ],
                ),
                customTextField(controller: nameController, title: "Nama", hintText: "Masukkan nama",),
                customTextField(controller: usiaController, title: "Usia", hintText: "Masukkan Usia",),
                customTextField(controller: jeniskelaminController, title: "Jenis_Kelamin", hintText: "Masukkan Jenis Kelamin",),
                customTextField(controller: tanggallahirController, title: "Tanggal Lahir", hintText: "Masukkan Tanggal Lahir",),
                Container(
            margin: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: _Update,
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                backgroundColor: const Color(0xffe5737d), // Ubah warna teks
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                minimumSize: const Size(230, 50),
              ),
              child: const Text(
                'Update',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          )
              ],
            ),
          )),
    );
  }
}

class customTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  const customTextField({
    super.key,
    required this.controller, required this.title, required this.hintText,
  });

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 29),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
          title,
          style: TextStyle(
            color: Colors.black, // Ubah warna teks
            height: 3,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      Container(
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.bottom,
          controller: controller,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Color(0xffA9A9A9),
                )
              ),
              hintText: hintText ),
          obscureText: true,
        ),
      ),
        ],
      ),
    );
  }
}