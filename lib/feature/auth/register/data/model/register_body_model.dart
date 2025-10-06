import 'package:json_annotation/json_annotation.dart';

part 'register_body_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterBodyModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  RegisterBodyModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  /// Factory to create instance from JSON map
  factory RegisterBodyModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterBodyModelFromJson(json);

  /// Convert instance to JSON map
  Map<String, dynamic> toJson() => _$RegisterBodyModelToJson(this);


  }



