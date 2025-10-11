import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_service.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/feature/home/data/model/product_model.dart';

class ProductsRepo {
  final ApiService apiService;

  ProductsRepo(this.apiService);

  Future<Either<Failure, ProductModel>> getProducts() async {
    try {
      final response = await apiService.getProducts();

      return Right(response);
    } on DioException catch (dioError) {
      return left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
