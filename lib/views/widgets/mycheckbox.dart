import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:shopapp/utils/themes.dart';

class Mycheck extends StatefulWidget {
  const Mycheck({Key? key}) : super(key: key);

  @override
  State<Mycheck> createState() => _MycheckState();
}

class _MycheckState extends State<Mycheck> {
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          controller.checkBoxMode();
        });
      },
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Get.isDarkMode ? Colors.white : Colors.black12,
        ),
        child: controller.checkBox
            ? Image.asset('assets/images/check.png',
                color: Get.isDarkMode ? pinkClr : mainColor)
            : null,
      ),
    );
  }
}
