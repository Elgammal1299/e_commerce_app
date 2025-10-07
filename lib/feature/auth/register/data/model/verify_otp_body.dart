import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_body.g.dart';

@JsonSerializable()
class VerifyOtpBody {
  final String email;
  final String otp;

  VerifyOtpBody({required this.email, required this.otp});

  factory VerifyOtpBody.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpBodyFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpBodyToJson(this);
}
