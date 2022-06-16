// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/utils/themes.dart';
import 'package:shopapp/views/widgets/mytext.dart';

Widget customtextlink({
  required String text,
  required String link,
  required Function() onPressed,
  bool textLinkOnly = false,
  Color? linkColor,
  Color? textColor,
}) =>
    textLinkOnly
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mytext(
                  text: text,
                  isContainerEnabled: false,
                  textsize: 15,
                  // ignore: prefer_if_null_operators
                  color: false,
                  setcolor: textColor),
              TextButton(
                onPressed: onPressed,
                child: mytext(
                    text: link,
                    isContainerEnabled: false,
                    textsize: 15,
                    // ignore: prefer_if_null_operators
                    color: true,
                    textDecoration: TextDecoration.underline),
              )
            ],
          )
        : Container(
            //++++++++++++++++++++++++++++++     with Container
            height: 80,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? pinkClr : mainColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 25),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mytext(
                  text: text,
                  isContainerEnabled: false,
                  textsize: 15,
                  setcolor: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                TextButton(
                  onPressed: onPressed,
                  child: mytext(
                      text: link,
                      isContainerEnabled: false,
                      textsize: 15,
                      textDecoration: TextDecoration.underline),
                )
              ],
            ),
          );
