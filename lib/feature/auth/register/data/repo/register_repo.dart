import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_service.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/feature/auth/register/data/model/register_body_model.dart';
import 'package:e_commerce_app/feature/auth/register/data/model/register_response_model.dart';

class RegisterRepo {
  final ApiService apiService;

  RegisterRepo(this.apiService);

  Future<Either<Failure, RegisterResponseModel>> register(
    RegisterBodyModel body,
  ) async {
    try {
      final response = await apiService.register(body);

    

      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
