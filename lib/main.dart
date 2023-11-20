import 'package:flutter_dev/model/Resep.dart';
import 'package:flutter_dev/model/ratinguser.dart';
import 'package:flutter_dev/screen/Main_Page.dart';
import 'package:flutter_dev/screen/bookmarkPage.dart';
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
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dev/firebase_options.dart';
import 'package:provider/provider.dart';
import './model/Profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Profile()),
          ChangeNotifierProvider(create: (context) => Resep()),
          ChangeNotifierProvider(create: (context) => RatingUser())
        ],
        child: MaterialApp(
          // get material app
          debugShowCheckedModeBanner: false,
          title: 'COOKOS',
          theme: ThemeData(fontFamily: 'Poppins'),
          //initialRoute: LoginPage.routeName,
          home: SplashScreenPage(),
          // routes: {
          //   '/': (context) => const SplashScreenPage(),
          //   '/login': (context) => const LoginPage(),
          //   '/logout': (context) => const logout(),
          //   '/homepage': (context) => const homepage(),
          //   '/registrasi': (context) => const Registrasi(),
          //   '/input_resep': (context) => const inputPage(),
          //   '/edit_profile': (context) => const EditProfile(),
          //   '/Melihat_profile': (context) => const seeProfile(),
          //   '/filter_resep': (context) => const filterResep(),
          //   //'/bookmarkPage': (context) => const bookmarkPage(),
          //   '/rating_review': (context) => const RatingPage(),
          //   // '/meilhat_resep': (context) => const melihatResep(),
          //   '/meilhat_resep_senior': (context) => const melihatResepSenior(),
          // }
        ));
  }
}
