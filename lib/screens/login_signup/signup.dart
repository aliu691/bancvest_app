import 'package:bancvest_app/constants/colors.dart';
import 'package:bancvest_app/constants/text_style.dart';
import 'package:bancvest_app/screens/home/home_screen.dart';
import 'package:bancvest_app/widgets/common/custom_button.dart';
import 'package:bancvest_app/widgets/common/custom_text_field.dart';
import 'package:flutter/material.dart';

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
                  CustomTextField(
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    hintText: 'First Name',
                    onSaved: (value) {},
                    isPassword: false,
                    textController: firstNameController,
                  ),
                  CustomTextField(
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    hintText: 'Last Name',
                    onSaved: (value) {},
                    isPassword: false,
                    textController: lastNameController,
                  ),
                  CustomTextField(
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    hintText: 'Email',
                    onSaved: (value) {},
                    isPassword: false,
                    textController: emailController,
                  ),
                  CustomTextField(
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    hintText: 'Password',
                    onSaved: (value) {},
                    isPassword: true,
                    textController: passwordController,
                  ),
                  CustomTextField(
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
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
