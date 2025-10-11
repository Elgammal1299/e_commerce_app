part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final ProductModel productModel;

  ProductSuccess(this.productModel);
}

final class ProductError extends ProductState {
  final String errMessage;

  ProductError(this.errMessage);
}
