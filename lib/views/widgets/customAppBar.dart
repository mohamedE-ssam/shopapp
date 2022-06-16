// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/views/widgets/mytext.dart';

AppBar myAppbar(BuildContext context, {String? title, bool center = true}) =>
    AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      title: title == null
          ? null
          : mytext(
              text: title,
              isContainerEnabled: false,
              textsize: 20,
              color: true),
      centerTitle: center,
    );
