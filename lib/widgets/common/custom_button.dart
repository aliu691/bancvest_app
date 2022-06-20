import 'package:bancvest_app/constants/colors.dart';
import 'package:bancvest_app/constants/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final TextStyle? labelStyle;
  final Color? background;
  final VoidCallback action;

  const CustomButton(
      {Key? key,
      required this.label,
      this.width,
      this.height,
      this.labelStyle,
      required this.action,
      this.background})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 5,
        shadowColor: CustomColors.textBlack,
        primary: background ?? CustomColors.customGreen,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
              color: CustomColors.customGreen,
              width: 2.0,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(width ?? 130, height ?? 50),
      ),
      child: Text(
        label,
        style: labelStyle ?? CustomTextStyles.dashboardGenericStyle,
      ),
    );
  }
}
