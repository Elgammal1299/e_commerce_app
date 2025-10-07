import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_service.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/feature/auth/register/data/model/verify_otp_body.dart';

class VerifyEmailRepo {
  final ApiService apiService;

  VerifyEmailRepo(this.apiService);

  Future<Either<Failure, String>> verifyEmail(VerifyOtpBody body) async {
    try {
      final response = await apiService.verifyEmail(body);

      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
