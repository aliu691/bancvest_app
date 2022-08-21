import 'package:bancvest_app/constants/colors.dart';
import 'package:bancvest_app/constants/text_style.dart';
import 'package:bancvest_app/helpers/input_validator.dart';
import 'package:bancvest_app/models/user_form_data.dart';
import 'package:bancvest_app/models/user_model.dart';
import 'package:bancvest_app/screens/home/home_screen.dart';
import 'package:bancvest_app/widgets/common/custom_button.dart';
import 'package:bancvest_app/widgets/common/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final _formData = UserFormData();

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
                    validator: InputValidator.nameValidator,
                    hintText: 'First Name',
                    onSaved: (value) {
                      //_formData.firstName = value!.trim();
                    },
                    isPassword: false,
                    textController: firstNameController,
                  ),
                  CustomTextField(
                    obscureText: false,
                    validator: InputValidator.nameValidator,
                    hintText: 'Last Name',
                    onSaved: (value) {
                      //_formData.lastName = value!.trim();
                    },
                    isPassword: false,
                    textController: lastNameController,
                  ),
                  CustomTextField(
                    obscureText: false,
                    validator: InputValidator.emailValidator,
                    hintText: 'Email',
                    onSaved: (value) {
                      //_formData.email = value;
                    },
                    isPassword: false,
                    textController: emailController,
                  ),
                  CustomTextField(
                    obscureText: true,
                    validator: InputValidator.passwordValidator,
                    hintText: 'Password',
                    onSaved: (value) {
                      _formData.password = value;
                    },
                    isPassword: true,
                    textController: passwordController,
                  ),
                  CustomTextField(
                    obscureText: true,
                    validator: (v) => InputValidator.confirmPasswordValidator(
                        v, passwordController.text),
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const HomePage(),
                        //   ),
                        // );
                        _signUp(emailController.text, passwordController.text);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // _signUp(UserFormData formData) async {
  //   try {
  //     await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //           email: formData.email.toString(),
  //           password: formData.password.toString(),
  //         )
  //         .then((value) => {_postDetailsToFirestore(formData)})
  //         .catchError((e) {
  //       Fluttertoast.showToast(
  //         msg: e.toString(),
  //         backgroundColor: CustomColors.customRed,
  //       );
  //       if (kDebugMode) {
  //         print(e);
  //       }
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       Fluttertoast.showToast(
  //         msg: e.message ?? 'weak password',
  //         backgroundColor: CustomColors.customRed,
  //       );
  //     } else if (e.code == 'email-already-in-use') {
  //       Fluttertoast.showToast(
  //         msg: e.message ?? 'account already existing',
  //         backgroundColor: CustomColors.customRed,
  //       );
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //       msg: e.toString(),
  //       backgroundColor: CustomColors.customRed,
  //     );
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  // }

  // _postDetailsToFirestore(UserFormData formData) async {
  //   User? user = FirebaseAuth.instance.currentUser;

  //   UserFormData userModel = UserFormData();

  //   userModel.firstName = formData.firstName;
  //   userModel.lastName = formData.lastName;
  //   userModel.email = user!.email;
  //   userModel.uid = user.uid;

  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user.uid)
  //       .set(userModel.toJson());
  //   Fluttertoast.showToast(
  //       msg: "account created successfully",
  //       backgroundColor: CustomColors.customGreen);
  //   if (!mounted) return;
  //   Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (context) => const HomePage()),
  //       (route) => false);
  // }

  _signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => {_postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: CustomColors.customRed,
        );
        if (kDebugMode) {
          print(e);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
          msg: e.message ?? 'weak password',
          backgroundColor: CustomColors.customRed,
        );
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: e.message ?? 'account already existing',
          backgroundColor: CustomColors.customRed,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: CustomColors.customRed,
      );
      if (kDebugMode) {
        print(e);
      }
    }
  }

  _postDetailsToFirestore() async {
    User? user = FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel();

    userModel.firstName = firstNameController.text;
    userModel.lastName = lastNameController.text;
    userModel.email = user!.email;
    userModel.uid = user.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(
        msg: "account created successfully",
        backgroundColor: CustomColors.customGreen);
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false);
  }
}
