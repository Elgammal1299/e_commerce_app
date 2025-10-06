// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterBodyModel _$RegisterBodyModelFromJson(Map<String, dynamic> json) =>
    RegisterBodyModel(
      email: json['email'] as String,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$RegisterBodyModelToJson(RegisterBodyModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
