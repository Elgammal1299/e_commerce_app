part of 'product_id_cubit.dart';

sealed class ProductIdState {}

final class ProductIdInitial extends ProductIdState {}
final class ProductIdLoading extends ProductIdState {}

final class ProductIdSuccess extends ProductIdState {
  final ProductIdModel productModel;

  ProductIdSuccess(this.productModel);
}

final class ProductIdError extends ProductIdState {
  final String errMessage;

  ProductIdError(this.errMessage);
}