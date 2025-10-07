import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_constants.dart';
import 'package:e_commerce_app/feature/auth/register/data/model/register_body_model.dart';
import 'package:e_commerce_app/feature/auth/register/data/model/register_response_model.dart';
import 'package:e_commerce_app/feature/auth/register/data/model/verify_otp_body.dart';

import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

/// This is the API service class that handles all the API calls.
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(
    Dio dio, {
    ParseErrorLogger? errorLogger,
    String? baseUrl,
  }) = _ApiService;

  // =================== Auth ===================

  // service for email register
  @POST(ApiConstants.register)
  Future<RegisterResponseModel> register(@Body() RegisterBodyModel body);
  // service for verifyEmail
  @POST(ApiConstants.verifyEmail)
  Future<String> verifyEmail(@Body() VerifyOtpBody body);
}
