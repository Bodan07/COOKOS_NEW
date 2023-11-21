import 'package:flutter/material.dart';

class loginForm extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const loginForm({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: const TextStyle(
          // color: Color.fromARGB(255, 0, 0, 0),
          ),
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: 18), //Change this value to custom as you like
        // isDense: true,

        filled: true,
        fillColor: Color.fromARGB(255, 254, 254, 254),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 16,
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 70),
        prefixIcon: Icon(Icons.email_outlined),
        prefixIconColor: Color.fromARGB(137, 191, 187, 187),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(131, 138, 124, 124), width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(249, 247, 220, 220), width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
