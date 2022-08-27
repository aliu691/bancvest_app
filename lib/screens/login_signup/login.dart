import 'package:bancvest_app/constants/colors.dart';
import 'package:bancvest_app/constants/text_style.dart';
import 'package:bancvest_app/helpers/input_validators.dart';
import 'package:bancvest_app/screens/home/home_screen.dart';
import 'package:bancvest_app/screens/login_signup/signup.dart';
import 'package:bancvest_app/widgets/common/custom_button.dart';
import 'package:bancvest_app/widgets/common/custom_text_field.dart';
import 'package:flutter/material.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    onSaved: (value) {},
                    isPassword: false,
                    textController: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    obscureText: true,
                    label: 'Password',
                    validator: InputValidator.textValidator,
                    hintText: 'Enter your password',
                    onSaved: (value) {},
                    isPassword: true,
                    textController: passwordController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
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
}
