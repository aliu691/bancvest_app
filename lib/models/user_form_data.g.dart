// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_form_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFormData _$UserFormDataFromJson(Map<String, dynamic> json) => UserFormData(
      uid: json['uid'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserFormDataToJson(UserFormData instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
    };
