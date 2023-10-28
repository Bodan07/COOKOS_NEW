import 'package:flutter_dev/screen/edit_profile.dart';
import 'package:flutter_dev/screen/input_resep.dart';
import 'package:flutter_dev/screen/logout.dart';
import 'package:flutter_dev/screen/meilhat_resep.dart';
import 'package:flutter_dev/screen/splash.dart';
import 'package:flutter_dev/screen/login.dart';
import 'package:flutter_dev/screen/Melihat_profile.dart';
import 'package:flutter_dev/screen/homepage.dart';
import 'package:flutter_dev/screen/filter_resep.dart';
import 'package:flutter_dev/screen/rating_review.dart';
import 'package:flutter_dev/screen/meilhat_resep_senior.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev/screen/registrasi.dart';
import 'package:flutter_dev/screen/test.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dev/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // get material app
        debugShowCheckedModeBanner: false,
        title: 'COOKOS',
        theme: ThemeData(fontFamily: 'Poppins'),
        //initialRoute: LoginPage.routeName,
        home: RatingPage(),
        routes: {
          // '/': (context) => const SplashScreenPage(),
          // '/login': (context) => const LoginPage(),
          //   '/registrasi': (context) => const Registrasi(),
          // '/edit_profile': (context) => const EditProfile(),
          // '/Melihat_profile': (context) => const seeProfile(),
          // '/filter_resep' :(context) => const filterResep(),

          // '/rating_review': (context) => const RatingPage(),
        }
        // getPages: [
        //   GetPage(name: LoginPage.routeName, page: () => const LoginPage()),
        //   GetPage(name: Registrasi.routeName, page: () => const Registrasi()),
        // ],
        );
  }
}

//  void main() {
//   runApp(const MaterialApp(
//     home: Center(
//       child: Text('Hello, World!'), // Add your "Hello, World!" message here
//     ),
//   ));
// }