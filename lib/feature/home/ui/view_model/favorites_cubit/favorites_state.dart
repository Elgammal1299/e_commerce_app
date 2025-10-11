part of 'favorites_cubit.dart';

sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesSuccess extends FavoritesState {
  final List<ProductItem> favoriteProducts;

  FavoritesSuccess(this.favoriteProducts);
}

final class FavoritesError extends FavoritesState {
  final String errMessage;

  FavoritesError(this.errMessage);
}
