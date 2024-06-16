import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_shipment_system/app/app_preferances.dart';
import 'package:smart_shipment_system/data/data_sourse/cache_data_sourse.dart';
import 'package:smart_shipment_system/data/data_sourse/local_data_sourse.dart';
import 'package:smart_shipment_system/data/data_sourse/remote_data_sourse.dart';
import 'package:smart_shipment_system/data/network/app_api.dart';
import 'package:smart_shipment_system/data/network/dio_factory.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/data/repository/repository_implementation.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/domain/use_cases/client_registration_usecase.dart';
import 'package:smart_shipment_system/domain/use_cases/login_usecase.dart';
import 'package:smart_shipment_system/domain/use_cases/splash_navigation_use_case.dart';
import 'package:smart_shipment_system/domain/use_cases/unorganized_delivery_registration_usecase.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseLoginViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/changePassword/viewModel/changePasswordViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/clientRegistration/viewModel/clientRegistrationViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/deliveryRegistration/viewModel/deliveryRegisterationViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/forgetPassword/viewModel/forgetPasswordViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/login/ViewModel/loginViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/verification/viewModel/verificationViewModel.dart';
import 'package:smart_shipment_system/presentation/client/home/view/clientHomeView.dart';
import 'package:smart_shipment_system/presentation/client/home/viewModel/clientHomeViewModel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance
      .registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementation(instance(), instance()));

  instance.registerLazySingleton<CacheDataSource>(
      () => CacheDataSourceImplementation());
  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImplementation(instance(), instance(), instance()));
  instance.registerLazySingleton<Repository>(
      () => RepositoryImplementation(instance(), instance()));
  instance.registerLazySingleton<SplashNavigationUseCase>(
      () => SplashNavigationUseCase(instance()));
}

reInitializeDio() async {
  Dio dio = await instance<DioFactory>().getDio();
  instance.unregister<AppServiceClient>();
  // instance.unregister<RemoteDataSource>();
  // instance.unregister<LocalDataSource>();
  // instance.unregister<Repository>();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  // instance.registerLazySingleton<RemoteDataSource>(
  //         () => RemoteDataSourceImplementation(instance(), instance()));
  // instance.registerLazySingleton<LocalDataSource>(
  //         () => LocalDataSourceImplementation(instance(), instance(), instance()));
  // instance.registerLazySingleton<Repository>(
  //         () => RepositoryImplementation(instance(), instance()));

}

initClientHomeModule() {
  if (!GetIt.I.isRegistered<ClientHomeViewModel>()) {
    instance.registerLazySingleton<ClientHomeViewModel>(
        () => ClientHomeViewModel(instance()));
  }
}

initLoginModule() {
  if (!GetIt.I.isRegistered<BaseLoginViewModel>()) {
    instance
        .registerLazySingleton<BaseLoginViewModel>(() => BaseLoginViewModel());
  }
  if (!GetIt.I.isRegistered<LoginViewModel>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));

    instance.registerLazySingleton<LoginViewModel>(
        () => LoginViewModel(instance(), instance()));
  }
}

initClientRegistrationModule() {
  if (!GetIt.I.isRegistered<ClientRegistrationViewModel>()) {
    instance.registerFactory<ClientRegistrationUseCase>(
        () => ClientRegistrationUseCase(instance()));

    instance.registerLazySingleton<ClientRegistrationViewModel>(
        () => ClientRegistrationViewModel(instance()));
  }
}

initDeliveryRegistrationModule() {
  if (!GetIt.I.isRegistered<DeliveryRegistrationViewModel>()) {
    instance.registerFactory<UnorganizedDeliveryRegistrationUseCase>(
        () => UnorganizedDeliveryRegistrationUseCase(instance()));

    instance.registerLazySingleton<DeliveryRegistrationViewModel>(
        () => DeliveryRegistrationViewModel(instance()));
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordViewModel>()) {
    instance.registerLazySingleton<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance()));
  }
}

initChangePasswordModule(String otp) {
  if (!GetIt.I.isRegistered<ChangePasswordViewModel>()) {
    instance.registerLazySingleton<ChangePasswordViewModel>(
        () => ChangePasswordViewModel(instance(), otp));
  }
}

initEmailVerificationModule(
    String email, String nextActionRoute, bool executeOrRouteOnly) {
  if (!GetIt.I.isRegistered<EmailVerificationViewModel>()) {
    instance.registerLazySingleton<EmailVerificationViewModel>(() =>
        EmailVerificationViewModel(
            instance(), email, nextActionRoute, executeOrRouteOnly));
  }
}
