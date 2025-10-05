import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_service.dart';
import 'package:e_commerce_app/core/api/dio_factory.dart';
import 'package:get_it/get_it.dart';


/// This is the dependency injection file for the app.
final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio Instance
  Dio dio = await DioFactory.getDio();

  // ✅ Register ApiService
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // // ✅ Register UserDataRepo
  // getIt.registerLazySingleton<UserDataRepo>(
  //   () => UserDataRepo(getIt<ApiService>()),
  // );

  // // ✅ Register Cubit
  // getIt.registerFactory<UserDataCubit>(
  //   () => UserDataCubit(getIt<UserDataRepo>()),
  // );

}
