import 'package:bancvest_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextStyles {
  CustomTextStyles._();

  static const TextStyle pageTitle =
      TextStyle(fontSize: 18, color: CustomColors.backGround);
  static const TextStyle nameStyle =
      TextStyle(fontSize: 26, color: CustomColors.textBlack);
  static const TextStyle accountIdStyle =
      TextStyle(fontSize: 14, color: CustomColors.textGrey);
  static const TextStyle dashboardGenericStyle = TextStyle(
      fontSize: 18, color: CustomColors.textBlack, fontWeight: FontWeight.bold);
}
