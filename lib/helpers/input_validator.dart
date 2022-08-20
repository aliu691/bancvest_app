import 'package:email_validator/email_validator.dart';

class InputValidator {
  InputValidator._();

  static String? textValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a Name';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (EmailValidator.validate(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    RegExp numeric = RegExp(r'^-?[0-9]+$');
    RegExp text = RegExp(r'a-z');

    if (value == null || value.isEmpty) {
      return 'Please Enter a Password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (numeric.hasMatch(value)) {
      return 'Password can\'t be only numbers';
    }
    if (text.hasMatch(value)) {
      return 'Password can\'t be only text';
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please Enter a Password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
