import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_shipment_system/app/app_preferances.dart';
import 'package:smart_shipment_system/data/data_sourse/local_data_sourse.dart';
import 'package:smart_shipment_system/data/data_sourse/remote_data_sourse.dart';
import 'package:smart_shipment_system/data/repository/repository_implementation.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/domain/use_cases/splash_navigation_use_case.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseLoginViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseRegisterationViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/changePassword/viewModel/changePasswordViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/forgetPassword/viewModel/forgetPasswordViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/login/manager/loginCubit.dart';

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

initLoginModule() {
//  if (!GetIt.I.isRegistered<LoginUseCase>()) {
   // instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
  // BlocProvider(create: (context)=>LoginCubit()
  //
  //
  // );
 // instance.registerLazySingleton<LoginCubit>(()=>LoginCubit());
  if(!GetIt.I.isRegistered<BaseLoginViewModel>()){
    instance.registerLazySingleton<BaseLoginViewModel>(() => BaseLoginViewModel());

  }

 // }




}


initClientRegistrationModule()
{
  if(!GetIt.I.isRegistered<BaseRegistrationViewModel>()){
    instance.registerLazySingleton<BaseRegistrationViewModel>(() => BaseRegistrationViewModel());

  }

}

  initForgotPasswordModule()
  {
    if(!GetIt.I.isRegistered<ForgotPasswordViewModel>()){
      instance.registerLazySingleton<ForgotPasswordViewModel>(() => ForgotPasswordViewModel());

    }}
initChangePasswordModule()
{
  if(!GetIt.I.isRegistered<ChangePasswordViewModel>()){
    instance.registerLazySingleton<ChangePasswordViewModel>(() => ChangePasswordViewModel());

  }}