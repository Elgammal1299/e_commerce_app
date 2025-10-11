import 'package:e_commerce_app/core/helper/shaerd_pref_helper.dart';
import 'package:e_commerce_app/feature/home/data/model/product_model.dart';
import 'package:e_commerce_app/feature/home/data/repo/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.productsRepo) : super(FavoritesInitial());
  final ProductsRepo productsRepo;

  /// Loads all favorites from SharedPreferences
  Future<void> loadFavorites() async {
    emit(FavoritesLoading());

    try {
      List<String> favoriteIds = await SharedPrefHelper.getFavorites();

      if (favoriteIds.isEmpty) {
        emit(FavoritesSuccess([]));
        return;
      }

      // Get all products and filter favorites
      final result = await productsRepo.getProducts();

      result.fold(
        (failure) {
          emit(FavoritesError(failure.errMessage));
        },
        (productModel) {
          // Filter products that are in favorites
          List<ProductItem> favoriteProducts = productModel.items
              .where((product) => favoriteIds.contains(product.id))
              .toList();

          emit(FavoritesSuccess(favoriteProducts));
        },
      );
    } catch (e) {
      emit(FavoritesError('Failed to load favorites: $e'));
    }
  }

  /// Toggles favorite status for a product
  Future<void> toggleFavorite(String productId) async {
    try {
      bool isNowFavorite = await SharedPrefHelper.toggleFavorite(productId);

      // Update current state if we have favorite products loaded
      if (state is FavoritesSuccess) {
        final currentState = state as FavoritesSuccess;
        List<ProductItem> updatedFavorites = List.from(
          currentState.favoriteProducts,
        );

        if (isNowFavorite) {
          // Add product to favorites (we need to get the product details)
          final result = await productsRepo.getProducts();
          result.fold((failure) => emit(FavoritesError(failure.errMessage)), (
            productModel,
          ) {
            final product = productModel.items.firstWhere(
              (p) => p.id == productId,
              orElse: () => throw Exception('Product not found'),
            );
            updatedFavorites.add(product);
            emit(FavoritesSuccess(updatedFavorites));
          });
        } else {
          // Remove product from favorites
          updatedFavorites.removeWhere((product) => product.id == productId);
          emit(FavoritesSuccess(updatedFavorites));
        }
      }
    } catch (e) {
      emit(FavoritesError('Failed to toggle favorite: $e'));
    }
  }

  /// Checks if a product is in favorites
  Future<bool> isFavorite(String productId) async {
    return await SharedPrefHelper.isFavorite(productId);
  }

  /// Adds a product to favorites
  Future<void> addToFavorites(String productId) async {
    await SharedPrefHelper.addToFavorites(productId);
    await loadFavorites(); // Reload to update state
  }

  /// Removes a product from favorites
  Future<void> removeFromFavorites(String productId) async {
    await SharedPrefHelper.removeFromFavorites(productId);
    await loadFavorites(); // Reload to update state
  }

  /// Clears all favorites
  Future<void> clearAllFavorites() async {
    await SharedPrefHelper.setFavorites([]);
    emit(FavoritesSuccess([]));
  }
}
