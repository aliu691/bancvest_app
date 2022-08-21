import 'package:bancvest_app/constants/colors.dart';
import 'package:bancvest_app/constants/text_style.dart';
import 'package:bancvest_app/helpers/input_validator.dart';
import 'package:bancvest_app/screens/home/home_screen.dart';
import 'package:bancvest_app/screens/login_signup/signup.dart';
import 'package:bancvest_app/services/firebase.dart';
import 'package:bancvest_app/widgets/common/custom_button.dart';
import 'package:bancvest_app/widgets/common/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: Image.asset(
                      "assets/images/logo.jpeg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  CustomTextField(
                    obscureText: false,
                    label: 'Email',
                    validator: InputValidator.emailValidator,
                    hintText: 'Enter your Email',
                    onSaved: (value) {
                      emailController.text = value!.trim();
                    },
                    isPassword: false,
                    textController: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    obscureText: true,
                    label: 'Password',
                    validator: InputValidator.passwordValidator,
                    hintText: 'Enter your password',
                    onSaved: (value) {
                      passwordController.text = value!;
                    },
                    isPassword: true,
                    textController: passwordController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    action: () {
                      if (formKey.currentState!.validate()) {
                        _signIn(emailController.text, passwordController.text);
                      }
                    },
                    label: 'Login',
                    width: 370,
                    height: 50,
                    labelStyle: CustomTextStyles.nameStyle
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
                      style: CustomTextStyles.dashboardGenericStyle
                          .copyWith(color: CustomColors.customGreen),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account yet? ",
                        style: CustomTextStyles.dashboardGenericStyle,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: CustomTextStyles.dashboardGenericStyle
                              .copyWith(color: CustomColors.customGreen),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
          msg: e.message ?? 'user not found',
          backgroundColor: CustomColors.customRed,
        );
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: e.message ?? 'wrong password',
          backgroundColor: CustomColors.customRed,
        );
      }
    }
  }
}
