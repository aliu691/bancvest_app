import 'package:bancvest_app/constants/colors.dart';
import 'package:bancvest_app/constants/text_style.dart';
import 'package:bancvest_app/helpers/input_validators.dart';
import 'package:bancvest_app/screens/login_signup/login.dart';
import 'package:bancvest_app/widgets/common/custom_button.dart';
import 'package:bancvest_app/widgets/common/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final emailController = TextEditingController();
final formKey = GlobalKey<FormState>();

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.backGround,
        leading: IconButton(
          onPressed: (() {
            Navigator.pop(context);
          }),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: CustomColors.customGreen,
            size: 30,
          ),
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 10,
          bottom: 35,
        ),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Text(
                  'Please Enter your email, to receive a reset link',
                  style: CustomTextStyles.pageTitle
                      .copyWith(color: CustomColors.textBlack),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  obscureText: false,
                  label: 'Email',
                  validator: InputValidator.emailValidator,
                  hintText: 'Enter your Email',
                  onSaved: (value) {},
                  isPassword: false,
                  textController: emailController,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  action: () {
                    _resetPassword(emailController.text.trim(), context);
                  },
                  label: 'Reset Password',
                  width: 370,
                  height: 50,
                  labelStyle:
                      CustomTextStyles.nameStyle.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

_resetPassword(email, BuildContext context) async {
  if (formKey.currentState!.validate()) {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
          msg: 'Reset email Successfully sent',
          backgroundColor: CustomColors.customGreen);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message!, backgroundColor: CustomColors.customRed);
      print(e);
    }
  }
}
