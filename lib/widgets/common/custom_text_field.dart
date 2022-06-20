import 'package:bancvest_app/constants/colors.dart';
import 'package:bancvest_app/constants/text_style.dart';
import 'package:flutter/material.dart';

final errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    color: CustomColors.customRed,
  ),
);

final focusBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    color: CustomColors.customGreen,
  ),
);

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  bool obscureText = false;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String label;
  final FormFieldValidator<String?> validator;
  final String hintText;
  final TextStyle? hintTextStyle;
  final FormFieldSetter<String?> onSaved;
  final bool isPassword;
  final TextEditingController? textController;
  CustomTextField({
    Key? key,
    this.keyboardType,
    required this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    required this.label,
    required this.validator,
    required this.hintText,
    this.hintTextStyle,
    required this.onSaved,
    required this.isPassword,
    required this.textController,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: CustomTextStyles.dashboardGenericStyle.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          autofocus: false,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          onSaved: widget.onSaved,
          controller: widget.textController,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: _togglePasswordShow,
                    icon: Icon(
                      widget.obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_off,
                      color: CustomColors.textBlack,
                    ))
                : widget.suffixIcon,
            errorBorder: errorBorder,
            enabledBorder: focusBorder,
            focusedBorder: focusBorder,
            hintText: widget.hintText,
            hintStyle: widget.hintTextStyle ??
                CustomTextStyles.accountIdStyle.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }

  _togglePasswordShow() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }
}
