import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_constants.dart';
import 'package:e_commerce_app/feature/auth/register/data/model/register_body_model.dart';
import 'package:e_commerce_app/feature/auth/register/data/model/register_response_model.dart';

import 'package:retrofit/retrofit.dart';

part 'register_data_sources.g.dart';

/// This is the API service class that handles all the API calls.
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RegisterDataSources {
  factory RegisterDataSources(
    Dio dio, {
    ParseErrorLogger? errorLogger,
    String? baseUrl,
  }) = _RegisterDataSources;

  // =================== Auth ===================

  // service for apple register
  @POST(ApiConstants.register)
  Future<RegisterResponseModel> appleLogin(@Body() RegisterBodyModel body);
    


}
