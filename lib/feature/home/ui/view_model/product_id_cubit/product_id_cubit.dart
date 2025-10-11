import 'package:e_commerce_app/feature/home/data/model/product_id_model.dart';
import 'package:e_commerce_app/feature/home/data/repo/product_id_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_id_state.dart';

class ProductIdCubit extends Cubit<ProductIdState> {
  ProductIdCubit(this.productsRepo) : super(ProductIdInitial());
  final ProductIdRepo productsRepo;
  Future<void> getProduct(String id) async {
    emit(ProductIdLoading());

    final result = await productsRepo.getProductById(id);

    result.fold(
      (failure) {
        emit(ProductIdError(failure.errMessage));
      },
      (response) {
        emit(ProductIdSuccess(response));
      },
    );
  }
}
