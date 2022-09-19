import 'package:bancvest_app/constants/colors.dart';
import 'package:bancvest_app/constants/text_style.dart';
import 'package:bancvest_app/helpers/input_validators.dart';
import 'package:bancvest_app/screens/home/home_screen.dart';
import 'package:bancvest_app/widgets/common/custom_button.dart';
import 'package:bancvest_app/widgets/common/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final firstNameController = TextEditingController();
final lastNameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmpasswordController = TextEditingController();

final formKey = GlobalKey<FormState>();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 35),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  // CustomTextField(
                  //   obscureText: false,
                  //   validator: InputValidator.nameValidator,
                  //   hintText: 'First Name',
                  //   onSaved: (value) {},
                  //   isPassword: false,
                  //   textController: firstNameController,
                  // ),
                  // CustomTextField(
                  //   obscureText: false,
                  //   validator: InputValidator.nameValidator,
                  //   hintText: 'Last Name',
                  //   onSaved: (value) {},
                  //   isPassword: false,
                  //   textController: lastNameController,
                  // ),
                  CustomTextField(
                    obscureText: false,
                    validator: InputValidator.emailValidator,
                    hintText: 'Email',
                    onSaved: (value) {},
                    isPassword: false,
                    textController: emailController,
                  ),
                  CustomTextField(
                    obscureText: true,
                    validator: InputValidator.passwordValidator,
                    hintText: 'Password',
                    onSaved: (value) {},
                    isPassword: true,
                    textController: passwordController,
                  ),
                  CustomTextField(
                    obscureText: true,
                    validator: (value) {
                      InputValidator.confirmPasswordValidator(
                          value, passwordController.text);
                      return null;
                    },
                    hintText: 'Confirm Password',
                    onSaved: (value) {},
                    isPassword: true,
                    textController: confirmpasswordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      width: 370,
                      height: 50,
                      label: "Signup",
                      labelStyle: CustomTextStyles.dashboardGenericStyle
                          .copyWith(
                              color: CustomColors.textWhite, fontSize: 20),
                      action: () {
                        signup(emailController.text.trim(),
                            passwordController.text, context);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

signup(email, password, BuildContext context) async {
  if (formKey.currentState!.validate()) {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: 'The password provided is too weak.',
            backgroundColor: CustomColors.customRed);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.',
            backgroundColor: CustomColors.customRed);
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
