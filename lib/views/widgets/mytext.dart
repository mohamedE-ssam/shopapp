import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/themes.dart';

Widget mytext({
  double right = 30,
  double left = 30,
  double top = 5,
  double bottom = 5,
  double margin = 10,
  TextDecoration textDecoration = TextDecoration.none,
  required String text,
  bool color = false,
  Color? setcolor,
  double textsize = 35,
  FontWeight fontWeight = FontWeight.bold,
  bool isContainerEnabled = true,
  TextAlign? textalign,
}) =>
    isContainerEnabled //ask if u want text with container or only text
        ? Container(
            padding: EdgeInsets.only(
                right: right, left: left, top: top, bottom: bottom),
            margin: EdgeInsets.all(margin),
            child: Text(
              text,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    decoration: textDecoration,
                    color: color
                        ? Get.isDarkMode
                            ? pinkClr
                            : mainColor
                        : Colors.white,
                    fontSize: textsize,
                    fontWeight: fontWeight),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(5)),
          )
        : Text(
            text,
            textAlign: textalign,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                decoration: textDecoration,
                color: color
                    ? Get.isDarkMode
                        ? pinkClr
                        : mainColor
                    // ignore: prefer_if_null_operators
                    : setcolor == null
                        ? Get.isDarkMode
                            ? Colors.white
                            : Colors.black
                        : setcolor,
                fontSize: textsize,
                fontWeight: fontWeight,
              ),
            ),
          );
