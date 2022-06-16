import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../views/widgets/customAppBar.dart';
import '../../../views/widgets/mybutton.dart';
import '../../../views/widgets/mytext.dart';
import '../../../utils/my_string.dart';
import '../../widgets/mytextfromfiled.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final formkey = GlobalKey<FormState>();
    final controller = Get.find<AuthController>();
    return Scaffold(
      appBar: myAppbar(context, title: 'Forgot Password'),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mytext(
                  text:
                      'If you want to recover your account. then please provide your email ID below .. ',
                  isContainerEnabled: false,
                  textsize: 16,
                  textalign: TextAlign.center),
              Image.asset('assets/images/forgetpass.png'),
              Form(
                key: formkey,
                child: myTextFromField(
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
              ),
              const SizedBox(
                height: 10,
              ),
              mybutton(
                  text: 'SEND',
                  onpressed: () {
                    if (formkey.currentState!.validate()) {
                      controller.resetPassword(emailController.text.trim());
                    }
                  },
                  width: double.infinity)
            ],
          )),
    );
  }
}
