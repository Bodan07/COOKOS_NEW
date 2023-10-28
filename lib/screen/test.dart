import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlassMessageScreen extends StatelessWidget {
  const FlassMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Masukkan Email dengan benar"),
                behavior : SnackBarBehavior.floating,
              )

            );
          },
          child: const Text("Show Message"),
        ),
      ),
    );
  }
}