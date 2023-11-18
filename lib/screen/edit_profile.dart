//import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dev/screen/Melihat_profile.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../model/Profile.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dev/model/Profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  //TextEditingController updateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usiaController = TextEditingController();
  TextEditingController jeniskelaminController = TextEditingController();
  TextEditingController tanggallahirController = TextEditingController();
  File? image;
  XFile? img;
  String imageurl = '';
  DateTime _dateTime = DateTime.now();
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = "";

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
      initialDatePickerMode: DatePickerMode.day,
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    img = imagePicked;
    setState(() {});
  }

  void UpDatabase(File? file) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    uid = auth.currentUser!.uid;
    Reference referenceDirImg = referenceRoot.child('profile');
    Reference uploadimg = referenceDirImg.child(uid);
    try {
      await uploadimg.putFile(File(file!.path));
      print("berhasil");
      imageurl = await uploadimg.getDownloadURL();
      print("berhasil2");
      _Update();
    } catch (error) {}
  }

  void _Update() {
    String nama = nameController.text;
    int usia = int.parse(usiaController.text);
    String jeniskelamin = jeniskelaminController.text;
    String tanggallahir = _dateTime.toString().split(' ')[0];
    context.read<Profile>().changeProfile(
        n: nama, u: usia, jk: jeniskelamin, tl: tanggallahir, img: imageurl);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => seeProfile()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Edit Profile",
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
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(14)),
                      ),
                      child: Stack(
                        children: [
                          image != null
                              ? Container(
                                  //tindakan 1
                                  margin: EdgeInsets.only(top: 50, left: 130),
                                  child: ClipOval(
                                    child: Image.file(
                                      image!,
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  //tindakan 2
                                  margin: EdgeInsets.only(top: 50, left: 130),
                                  width: 150,
                                  height: 150,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                          Positioned(
                              bottom: 50,
                              right: 140,
                              child: Container(
                                  //margin: EdgeInsets.only(top: 170, left: 220),
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white),
                                  child: IconButton(
                                    icon: Icon(Icons.photo_camera),
                                    color: Color(0xffe5737d),
                                    iconSize: 20,
                                    onPressed: () async {
                                      await getImage();
                                    },
                                  )))
                        ],
                      ),
                    ),
                  ],
                ),
                customTextField(
                  controller: nameController,
                  title: "Nama",
                  hintText: context.watch<Profile>().nama != ""
                      ? context.watch<Profile>().nama
                      : "masukan nama",
                ),
                customTextField(
                  controller: usiaController,
                  title: "Usia",
                  hintText: context.watch<Profile>().usia != 0
                      ? context.watch<Profile>().usia.toString()
                      : "masukan usia",
                ),
                customTextField(
                  controller: jeniskelaminController,
                  title: "Jenis Kelamin",
                  hintText: context.watch<Profile>().jenis_Kelamin != ""
                      ? context.watch<Profile>().jenis_Kelamin
                      : "masukan jenis kelamin",
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 29),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Tanggal Lahir',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                          onTap: _showDatePicker,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 7),
                              margin: EdgeInsets.only(top: 5),
                              height: 35,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(0, 0, 0, 0.6)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                context.watch<Profile>().tanggal_lahir != ""
                                    ? context.watch<Profile>().tanggal_lahir
                                    : "Choose Date",
                              )))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      UpDatabase(image);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 255, 255, 255),
                      backgroundColor:
                          const Color(0xffe5737d), // Ubah warna teks
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      minimumSize: const Size(230, 50),
                    ),
                    child: const Text(
                      'Update',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
    required this.controller,
    required this.title,
    required this.hintText,
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
                      )),
                  hintText: hintText),
              obscureText: false,
            ),
          ),
        ],
      ),
    );
  }
}
