import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_service.dart';
import 'package:e_commerce_app/core/api/dio_factory.dart';
import 'package:e_commerce_app/feature/auth/login/data/repo/lodin_repo.dart';
import 'package:e_commerce_app/feature/auth/login/ui/view_model/login_cubit/login_cubit.dart';
import 'package:e_commerce_app/feature/auth/register/data/repo/register_repo.dart';
import 'package:e_commerce_app/feature/auth/register/data/repo/verify_email_repo.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view_model/register_cubit/register_cubit.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view_model/verify_email_cubit/verify_email_cubit.dart';
import 'package:e_commerce_app/feature/home/data/repo/product_id_repo.dart';
import 'package:e_commerce_app/feature/home/data/repo/products_repo.dart';
import 'package:e_commerce_app/feature/home/ui/view_model/favorites_cubit/favorites_cubit.dart';
import 'package:e_commerce_app/feature/home/ui/view_model/product_cubit/product_cubit.dart';
import 'package:e_commerce_app/feature/home/ui/view_model/product_id_cubit/product_id_cubit.dart';
import 'package:get_it/get_it.dart';

/// This is the dependency injection file for the app.
final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio Instance
  Dio dio = await DioFactory.getDio();

  //✅ Register ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //================================
  // ✅ Register RegisterRepo
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepo(getIt<ApiService>()),
  );

  // ✅ Register Cubit
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterRepo>()),
  );
  //================================
  // ✅ Register VerifyEmailRepo
  getIt.registerLazySingleton<VerifyEmailRepo>(
    () => VerifyEmailRepo(getIt<ApiService>()),
  );

  // ✅ Register VerifyEmailCubit
  getIt.registerFactory<VerifyEmailCubit>(
    () => VerifyEmailCubit(getIt<VerifyEmailRepo>()),
  );
  //================================
  // ✅ Register LoginRepo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));

  // ✅ Register VerifyEmailCubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  //================================
  // ✅ Register ProductsRepo
  getIt.registerLazySingleton<ProductsRepo>(
    () => ProductsRepo(getIt<ApiService>()),
  );

  // ✅ Register ProductCubit
  getIt.registerFactory<ProductCubit>(
    () => ProductCubit(getIt<ProductsRepo>()),
  );
  //================================
  // ✅ Register ProductIdRepo
  getIt.registerLazySingleton<ProductIdRepo>(
    () => ProductIdRepo(getIt<ApiService>()),
  );

  // ✅ Register ProductIdCubit
  getIt.registerFactory<ProductIdCubit>(
    () => ProductIdCubit(getIt<ProductIdRepo>()),
  );
  //================================
  // ✅ Register FavoritesCubit
  getIt.registerFactory<FavoritesCubit>(
    () => FavoritesCubit(getIt<ProductsRepo>()),
  );
}
