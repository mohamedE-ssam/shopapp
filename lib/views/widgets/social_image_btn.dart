import 'package:flutter/material.dart';

Widget socialBTN(String assetLink, void Function() ontap) => InkWell(
      onTap: ontap,
      child: Image.asset(
        assetLink,
      ),
    );
