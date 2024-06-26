import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_shipment_system/app/app_preferances.dart';
import 'package:smart_shipment_system/data/data_sourse/cache_data_sourse.dart';
import 'package:smart_shipment_system/data/data_sourse/local_data_sourse.dart';
import 'package:smart_shipment_system/data/data_sourse/remote_data_sourse.dart';
import 'package:smart_shipment_system/data/network/app_api.dart';
import 'package:smart_shipment_system/data/network/chatBotAppService.dart';
import 'package:smart_shipment_system/data/network/chatBotDio.dart';
import 'package:smart_shipment_system/data/network/dio_factory.dart';
import 'package:smart_shipment_system/data/repository/repository_implementation.dart';
import 'package:smart_shipment_system/domain/entities/recomendedDeliveryEntity.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/domain/use_cases/client_registration_usecase.dart';
import 'package:smart_shipment_system/domain/use_cases/fixed_delivery_registration_usecase.dart';
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
import 'package:smart_shipment_system/presentation/client/createOrder/viewModel/clientCreateOrderViewModel.dart';
import 'package:smart_shipment_system/presentation/client/home/viewModel/clientHomeViewModel.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/delivery/home/viewModel/deliveryViewModel.dart';
import 'package:smart_shipment_system/presentation/delivery/main/viewModel/mainDeliveryViewModel.dart';
import 'package:smart_shipment_system/presentation/delivery/tripList/viewModel/tripListViewModel.dart';
import 'package:smart_shipment_system/presentation/userProfile/editProfileData/viewModel/editProfileDataViewModel.dart';
import 'package:smart_shipment_system/presentation/userProfile/viewModel/userProfileViewModel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  instance.registerLazySingleton<ChatBotDioFactory>(() => ChatBotDioFactory());
  Dio dio = await instance<DioFactory>().getDio();
  Dio chatBotDio = await instance<ChatBotDioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  instance.registerLazySingleton<ChatBotAppServiceClient>(
          () => ChatBotAppServiceClient(chatBotDio));
  instance
      .registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
  instance.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImplementation(instance(), instance()));
  instance.registerLazySingleton<CacheDataSource>(
          () => CacheDataSourceImplementation());
  instance.registerLazySingleton<LocalDataSource>(
          () =>
          LocalDataSourceImplementation(instance(), instance(), instance()));
  instance.registerLazySingleton<Repository>(() =>
      RepositoryImplementation(instance(), instance(), instance(), instance()));
  instance.registerLazySingleton<SplashNavigationUseCase>(
          () => SplashNavigationUseCase(instance()));
}

reInitializeDio() async {
  Dio dio = await instance<DioFactory>().getDio();
  instance.unregister<AppServiceClient>();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
}

initClientHomeModule(UserModel userModel) {
  if (!GetIt.I.isRegistered<ClientHomeViewModel>()) {
    instance.registerLazySingleton<ClientHomeViewModel>(
            () => ClientHomeViewModel(instance(), userModel));
  }
}

initDeliveryHomeModule(UserModel userModel) {
  if (!GetIt.I.isRegistered<DeliveryHomeViewModel>()) {
    instance.registerLazySingleton<DeliveryHomeViewModel>(
            () => DeliveryHomeViewModel(instance(), userModel));
  }
}

initClientAddShipmentModule(UserModel userModel) {
  if (!GetIt.I.isRegistered<ClientCreateOrderViewModel>()) {
    instance.registerLazySingleton<ClientCreateOrderViewModel>(
            () => ClientCreateOrderViewModel(instance(), userModel));
  }
}

initClientProfileModule(UserModel userModel) {
  if (!GetIt.I.isRegistered<UserProfileViewModel>()) {
    instance.registerLazySingleton<UserProfileViewModel>(
            () => UserProfileViewModel(instance(), userModel));
  }
}

initEditProfileModule(UserModel userModel) {
  if (!GetIt.I.isRegistered<EditUserProfileViewModel>()) {
    instance.registerLazySingleton<EditUserProfileViewModel>(
            () => EditUserProfileViewModel(instance(), userModel));
  }
}

initMainClientModule() {
  if (!GetIt.I.isRegistered<MainClientViewModel>()) {
    instance.registerLazySingleton<MainClientViewModel>(
            () => MainClientViewModel(instance()));
  }
}

initMainDeliveryModule() {
  if (!GetIt.I.isRegistered<MainDeliveryViewModel>()) {
    instance.registerLazySingleton<MainDeliveryViewModel>(
            () => MainDeliveryViewModel(instance()));
  }
}

initDeliveryTripListModule(List<DeliveryTripEntity> tripList) {
  if (!GetIt.I.isRegistered<TripListViewModel>()) {
    instance.registerLazySingleton<TripListViewModel>(
            () =>
        TripListViewModel(instance(), tripList)
          ..start());
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
    instance.registerFactory<FixedDeliveryRegistrationUseCase>(
            () => FixedDeliveryRegistrationUseCase(instance()));
    instance.registerLazySingleton<DeliveryRegistrationViewModel>(
            () => DeliveryRegistrationViewModel(instance(), instance()));
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

initEmailVerificationModule(String email, String nextActionRoute,
    bool executeOrRouteOnly) {
  if (!GetIt.I.isRegistered<EmailVerificationViewModel>()) {
    instance.registerLazySingleton<EmailVerificationViewModel>(() =>
        EmailVerificationViewModel(
            instance(), email, nextActionRoute, executeOrRouteOnly));
  }
}
