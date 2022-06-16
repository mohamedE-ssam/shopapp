import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/routes/routes.dart';
import 'package:shopapp/utils/themes.dart';
import 'package:shopapp/views/widgets/customTextLink.dart';
import 'package:shopapp/views/widgets/mybutton.dart';
import 'package:shopapp/views/widgets/mytext.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                mytext(text: 'Welcome to', textsize: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    mytext(
                        text: 'Sniper ',
                        right: 0,
                        margin: 0,
                        color: true,
                        fontWeight: FontWeight.w900),
                    mytext(
                        text: 'Shop',
                        left: 0,
                        margin: 0,
                        fontWeight: FontWeight.w900),
                  ],
                ),
                const SizedBox(
                  height: 130,
                ),
                mybutton(
                  text: 'Get Start',
                  onpressed: () {
                    Get.offNamed(Names.loginScreen);
                  },
                ),
                const SizedBox(
                  height: 70,
                ),
                customtextlink(
                    textLinkOnly: true,
                    text: "Don't have an Account ? ",
                    link: 'SginUP',
                    linkColor: mainColor,
                    textColor: Colors.white,
                    onPressed: () {
                      Get.offNamed(Names.signupScreen);
                    }),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
