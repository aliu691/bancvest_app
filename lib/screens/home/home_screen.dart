import 'package:bancvest_app/constants/colors.dart';
import 'package:bancvest_app/constants/text_style.dart';
import 'package:bancvest_app/models/user_model.dart';
import 'package:bancvest_app/widgets/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) => loggedInUser = UserModel.fromMap(value.data()));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backGround,
      appBar: AppBar(
        backgroundColor: CustomColors.customGreen,
        title: const Text(
          'Dashboard',
          style: CustomTextStyles.pageTitle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_active,
            color: CustomColors.backGround,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: CustomColors.backGround,
            ),
          )
        ],
      ),
      body: UserDashBoard(
        user: loggedInUser,
      ),
    );
  }
}
