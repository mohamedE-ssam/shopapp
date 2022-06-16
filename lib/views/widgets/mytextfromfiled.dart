import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/utils/themes.dart';

Widget myTextFromField(
        {TextEditingController? controller,
        TextInputType type = TextInputType.text,
        String? assetLink,
        double? widthForAsset,
        Widget? suffixIcon,
        bool password = false,
        required String hint,
        required Function vali}) =>
    SizedBox(
      height: 70,
      child: TextFormField(
        controller: controller,
        cursorColor: Get.isDarkMode ? pinkClr : mainColor,
        decoration: InputDecoration(
            helperText: ' ',
            prefixIcon: assetLink == null
                ? null
                : Image.asset(
                    assetLink,
                    width: widthForAsset,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
            suffixIcon: suffixIcon,
            fillColor: Get.isDarkMode ? kCOlor1 : kCOlor2,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            hintText: hint,
            hintStyle: const TextStyle(height: 0)),
        keyboardType: type,
        obscureText: password,
        validator: (v) => vali(v),
      ),
    );
