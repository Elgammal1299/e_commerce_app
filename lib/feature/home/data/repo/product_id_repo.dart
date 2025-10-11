import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_service.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/feature/home/data/model/product_id_model.dart';

class ProductIdRepo {
  final ApiService apiService;

  ProductIdRepo(this.apiService);

  Future<Either<Failure, ProductIdModel>> getProductById(String id) async {
    try {
      final response = await apiService.getProductsById(id);

      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
