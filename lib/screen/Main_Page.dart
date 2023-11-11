import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './homepage.dart';
import './login.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dev/model/Profile.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              context.read<Profile>().setid(snapshot.data!.uid);
              return homepage();
            } else {
              return LoginPage();
            }
          }),
    );
  }
}