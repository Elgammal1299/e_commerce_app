import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_service.dart';
import 'package:e_commerce_app/core/api/dio_factory.dart';
import 'package:e_commerce_app/feature/auth/register/data/repo/register_repo.dart';
import 'package:e_commerce_app/feature/auth/register/data/repo/verify_email_repo.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view_model/register_cubit/register_cubit.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view_model/verify_email_cubit/verify_email_cubit.dart';
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
}
