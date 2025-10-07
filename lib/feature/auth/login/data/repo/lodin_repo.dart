import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_service.dart';
import 'package:e_commerce_app/core/constant/shared_preferences_key.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/core/helper/shaerd_pref_helper.dart';
import 'package:e_commerce_app/feature/auth/login/data/model/login_body_model.dart';
import 'package:e_commerce_app/feature/auth/login/data/model/login_response_model.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);

  Future<Either<Failure, LoginResponseModel>> login(LoginBodyModel body) async {
    try {
      final response = await apiService.login(body);
      if (response.accessToken.isNotEmpty) {
        await SharedPrefHelper.setSecuredString(
          SharedPreferencesKeys.accessToken,
          response.accessToken,
        );
        log("Token saved successfully!");
      }
      if (response.refreshToken.isNotEmpty) {
        await SharedPrefHelper.setSecuredString(
          SharedPreferencesKeys.refreshToken,
          response.refreshToken,
        );
        log("Refresh Token saved successfully!");
      }

      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
