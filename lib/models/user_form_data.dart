import 'package:json_annotation/json_annotation.dart';

part 'user_form_data.g.dart';

@JsonSerializable()
class UserFormData {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  UserFormData({
    this.uid,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  factory UserFormData.fromJson(Map<String, dynamic> json) =>
      _$UserFormDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserFormDataToJson(this);
}
