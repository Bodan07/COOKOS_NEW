import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class thumbnailResep extends StatefulWidget {
  final String img;
  final String name;
  final String creator;
  final String rating;

  thumbnailResep(
      {required this.img,
      required this.name,
      required this.creator,
      required this.rating});

  @override
  State<thumbnailResep> createState() => _thumbnailResepState();
}

class _thumbnailResepState extends State<thumbnailResep> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
        width: 350,
        height: 174,
        decoration: BoxDecoration(
          //color: Colors.black,
          image: DecorationImage(
            image: AssetImage(widget.img),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              //margin: EdgeInsets.only(top: 110, left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 200,
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Popins",
                        fontSize: 19.78,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 20),
                    child: Text(
                      widget.creator,
                      style: TextStyle(
                        color: const Color(0xFFA9A9A9),
                        fontFamily: "Popins",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, left: 270),
                width: 68,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.39),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                    Text(
                      "4.0",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14.38,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
          ],
        ));
  }
}
