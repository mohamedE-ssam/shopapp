import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../views/widgets/customAppBar.dart';
import '../../../utils/my_string.dart';
import '../../../routes/routes.dart';
import '../../widgets/customTextLink.dart';
import '../../widgets/mybutton.dart';
import '../../widgets/mycheckbox.dart';
import '../../widgets/mytext.dart';
import '../../widgets/mytextfromfiled.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final controller = Get.find<AuthController>();
    final TextEditingController userController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: myAppbar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
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
                    text: 'SIGN ',
                    isContainerEnabled: false,
                    textsize: 40,
                    color: true,
                    fontWeight: FontWeight.normal,
                  ),
                  mytext(
                      text: 'UP',
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
                hint: 'User Name',
                controller: userController,
                vali: (v) {
                  if (v.toString().isEmpty ||
                      !RegExp(validationName).hasMatch(v)) {
                    return "Can't Take this Name ";
                  } else {
                    return null;
                  }
                },
                type: TextInputType.emailAddress,
                assetLink: 'assets/images/user.png',
                widthForAsset: 60,
              ),
              const SizedBox(
                height: 2,
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
                height: 2,
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
                    widthForAsset: 60);
              }),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  const Mycheck(),
                  customtextlink(
                      textLinkOnly: true,
                      text: "\t\t\tI accept",
                      link: "terms & condtions",
                      onPressed: () {})
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              mybutton(
                text: 'SIGN UP',
                onpressed: () async {
                  if (formkey.currentState!.validate() && controller.checkBox) {
                    controller.signupToFirebase(
                        emailController: emailController.text.trim(),
                        passwordController: passwordController.text,
                        nameController: userController.text.trim());
                  } else if (!controller.checkBox) {
                    controller.showmysnackbar(
                        text: 'Accept to Sign UP Please !');
                  }
                },
                width: double.infinity,
                height: 40,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: customtextlink(
          text: "Already have an Account ? ",
          link: 'Login',
          onPressed: () {
            controller.isVisible = false;
            Get.offNamed(Names.loginScreen);
          }),
    );
  }
}
