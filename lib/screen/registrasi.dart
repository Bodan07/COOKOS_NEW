import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dev/model/Profile.dart';
import 'package:flutter_dev/screen/login.dart';
import 'package:provider/provider.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({Key? key}) : super(key: key);

  @override
  State<Registrasi> createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<Registrasi> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _register() async {
    final docuser = FirebaseFirestore.instance.collection('/user');

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      FirebaseAuth auth = FirebaseAuth.instance;
      String uid = auth.currentUser!.uid;
      print(uid);
      final data = {
        'username': usernameController.text,
        'email': emailController.text,
      };
      await docuser.doc(uid).set(data);
      context.read<Profile>().createprofile(uid);
      FirebaseAuth.instance.signOut();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } on FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 63,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "COO",
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w700,
                  color: Colors.black, // Ubah warna teks
                ),
              ),
              Text(
                "KOS",
                style: TextStyle(
                  color: Color(0xFFE5737D),
                  fontSize: 64,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 42,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(154)),
                color: Color(0xffe5737d),
              ),
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 29),
                      child: Text(
                        "Buat Akun",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    customTextField(
                      controller: usernameController,
                      title: "Username",
                      hintText: "Masukkan username",
                      isPassword: false,
                    ),
                    customTextField(
                      controller: emailController,
                      title: "Email Address",
                      hintText: "Masukkan email address",
                      isPassword: false,
                    ),
                    customTextField(
                      controller: passwordController,
                      title: "Password",
                      hintText: "Masukkan password",
                      isPassword: true,
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          if (emailController.text == "" &&
                              usernameController.text == "" &&
                              passwordController.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Username, Email dan Passowrd tidak boleh kosong"),
                              behavior: SnackBarBehavior.floating,
                            ));
                          } else {
                            _register();
                          }
                        },
                        child: Text('Sign Up'),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(
                              255, 255, 255, 255), // Ubah warna latar belakang
                          onPrimary: const Color.fromARGB(
                              255, 0, 0, 0), // Ubah warna teks
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          minimumSize: Size(150, 40),
                        ),
                      ),
                    ),
<<<<<<< HEAD
                    SizedBox(height: 0),
=======
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        InkWell(
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                        )
                      ],
                    ),
>>>>>>> parent of 485d731 (update)
                  ],
                ),
              ),
            ),
          ),
          // Tambahkan teks di bawah layar
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              "Sudah memiliki akun? Login",
              style: TextStyle(
                color: Colors.black, // Ubah warna teks
                fontSize: 16, // Sesuaikan ukuran teks
              ),
            ),
          )
        ],
      ),
    );
  }
}

class customTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  const customTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    required this.isPassword,
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
              obscureText: isPassword,
            ),
          ),
        ],
      ),
    );
  }
}
