import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev/model/Resep.dart';
import 'package:flutter_dev/screen/registrasi.dart';
import 'RatingUser.dart';

class user {
  String id_user;
  String username;
  String password;
  String email;
  List<Resep> bookmark;
  List<RatingUser> rate;

  user(
      {required this.id_user,
      required this.username,
      required this.email,
      required this.password,
      required this.bookmark,
      required this.rate});

  String getid() {
    return id_user;
  }
}
