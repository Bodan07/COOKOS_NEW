import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev/screen/homepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dev/screen/registrasi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dev/model/Profile.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String uid = "";
  bool passToogle = true;

  void _login() async {
    String email = emailController.text;
    String password = passwordController.text;
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      uid = auth.currentUser!.uid;
      context.read<Profile>().setuser(uid);
      context.read<Profile>().fetchprofile();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => homepage()));
    } on FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double padding = 16.0; // Example padding value
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
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
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Ubah ini menjadi 'start'
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255), // Ubah warna teks
                          fontSize: 60,
                          fontWeight: FontWeight.bold
                           // Sesuaikan ukuran teks
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 500,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration( // Use 'filled: true' instead of 'filled = true'
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),// Specify the color here
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: const Color.fromARGB(255, 2, 2, 2)), // Set the desired label color
                          prefixIcon: Icon(Icons.email, color: const Color.fromARGB(255, 14, 14, 14)),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Container(
                      width: 500, // Set the desired width
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: !passToogle,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),// Specify the color here
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: const Color.fromARGB(255, 2, 2, 2)), // Set the desired label color
                          prefixIcon: Icon(Icons.password, color: const Color.fromARGB(255, 14, 14, 14)),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                // ignore: unnecessary_statements
                                passToogle = !passToogle;
                              });
                            },
                            child: Icon(
                              passToogle ? Icons.visibility : Icons.visibility_off),
                          ),
                          suffixIconColor:const Color.fromARGB(255, 2, 2, 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    //container button
                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.black, // Ubah warna teks
                            fontSize: 17,
                            fontWeight: FontWeight.w700, // Sesuaikan ukuran teks
                          ),
                        ),
                        onPressed: () {
                          if (emailController.text == "" &&
                              passwordController.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Email dan password tidak boleh kosong"),
                              behavior: SnackBarBehavior.floating,
                            ));
                          } else {
                            _login();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(
                              255, 255, 255, 255), // Ubah warna latar belakang
                          onPrimary: const Color.fromARGB(
                              255, 0, 0, 0), // Ubah warna teks
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          minimumSize: Size(300, 50),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.black, // Ubah warna teks
                            fontSize: 17,
                            fontWeight: FontWeight.w700, // Sesuaikan ukuran teks
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Registrasi()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(
                              255, 255, 255, 255), // Ubah warna latar belakang
                          onPrimary: const Color.fromARGB(
                              255, 0, 0, 0), // Ubah warna teks
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          minimumSize: Size(300, 50),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          // Tambahkan teks di bawah layar
        ],
      ),
    );
  }
}
