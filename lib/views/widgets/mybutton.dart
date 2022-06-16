import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/utils/themes.dart';
import 'package:shopapp/views/widgets/mytext.dart';

Widget mybutton(
        {required String text,
        required Function() onpressed,
        double height = 50,
        double width = 200,
        double textsize = 20,
        FontWeight fontWeight = FontWeight.bold}) =>
    SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onpressed,
        child: mytext(
            text: text,
            isContainerEnabled: false,
            setcolor: Get.isDarkMode ? Colors.black : Colors.white,
            fontWeight: fontWeight,
            textsize: textsize),
        style: ElevatedButton.styleFrom(
          primary: Get.isDarkMode ? pinkClr : mainColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
      ),
    );
