import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_shipment_system/app/app_preferances.dart';
import 'package:smart_shipment_system/data/data_sourse/local_data_sourse.dart';
import 'package:smart_shipment_system/data/data_sourse/remote_data_sourse.dart';
import 'package:smart_shipment_system/data/repository/repository_implementation.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/domain/use_cases/splash_navigation_use_case.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImplementation());
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementation());
  instance.registerLazySingleton<Repository>(
      () => RepositoryImplementation(instance(), instance()));
  instance.registerLazySingleton<SplashNavigationUseCase>(
      () => SplashNavigationUseCase(instance()));
}
