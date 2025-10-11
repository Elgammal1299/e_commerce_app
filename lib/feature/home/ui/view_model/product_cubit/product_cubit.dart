import 'package:e_commerce_app/feature/home/data/model/product_model.dart';
import 'package:e_commerce_app/feature/home/data/repo/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productsRepo) : super(ProductInitial());
  final ProductsRepo productsRepo;
  Future<void> getProduct() async {
    emit(ProductLoading());

    final result = await productsRepo.getProducts();

    result.fold(
      (failure) {
        emit(ProductError(failure.errMessage));
      },
      (response) {
        emit(ProductSuccess(response));
      },
    );
  }
}
