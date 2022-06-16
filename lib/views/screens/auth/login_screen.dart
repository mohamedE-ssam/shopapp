import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../views/widgets/customAppBar.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../widgets/mybutton.dart';
import '../../widgets/mycheckbox.dart';
import '../../widgets/mytext.dart';
import '../../widgets/mytextfromfiled.dart';
import '../../widgets/social_image_btn.dart';
import '../../widgets/customTextLink.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final controller = Get.find<AuthController>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: myAppbar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30, right: 30, left: 30),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  mytext(
                    text: 'LOG ',
                    isContainerEnabled: false,
                    textsize: 40,
                    color: true,
                    fontWeight: FontWeight.normal,
                  ),
                  mytext(
                      text: 'IN',
                      isContainerEnabled: false,
                      textsize: 40,
                      color: false,
                      fontWeight: FontWeight.normal)
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              myTextFromField(
                hint: 'Email',
                controller: emailController,
                vali: (v) {
                  if (!RegExp(validationEmail).hasMatch(v)) {
                    return "Wrong Email ";
                  } else {
                    return null;
                  }
                },
                type: TextInputType.emailAddress,
                assetLink: 'assets/images/email.png',
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<AuthController>(builder: (_) {
                return myTextFromField(
                  hint: 'Password',
                  controller: passwordController,
                  password: !controller.isVisible,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.visibility();
                    },
                    icon: controller.isVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  vali: (v) {
                    if (v.toString().length < 6) {
                      return "Wrong Password , at least 6 character ";
                    } else {
                      return null;
                    }
                  },
                  type: TextInputType.visiblePassword,
                  assetLink: 'assets/images/lock.png',
                  widthForAsset: 60,
                );
              }),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Names.forgotScreen);
                  },
                  child: mytext(
                    text: 'Forget Password ?',
                    isContainerEnabled: false,
                    textsize: 15,
                    color: false,
                  )),
              Row(
                children: [
                  const Mycheck(),
                  mytext(
                    text: '\t\t\tRemember Me ',
                    isContainerEnabled: false,
                    textsize: 15,
                    color: false,
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              mybutton(
                text: 'LOG IN',
                onpressed: () async {
                  if (formkey.currentState!.validate()) {
                    controller.loginToFirebase(
                        emailController: emailController.text.trim(),
                        passwordController: passwordController.text);
                  }
                },
                width: double.infinity,
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: const Text('OR'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialBTN('assets/images/facebook.png', () {}),
                  const SizedBox(
                    width: 15,
                  ),
                  socialBTN('assets/images/google.png', () {
                    //controller.signupWithGoogle();
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: customtextlink(
          text: "Dont't have an Account ",
          link: 'SignUP',
          onPressed: () {
            controller.isVisible = false;

            Get.toNamed(Names.signupScreen);
          }),
    );
  }
}
