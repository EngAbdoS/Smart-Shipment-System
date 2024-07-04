import 'package:flutter/material.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/domain/use_cases/login_usecase.dart';
import 'package:smart_shipment_system/presentation/authenticathion/baseViewModels/baseLoginViewModel.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/status/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/status/loadingState.dart';

class LoginViewModel extends BaseLoginViewModel {
  final LoginUseCase _loginUseCase;
  final Repository _repository;

  LoginViewModel(this._loginUseCase, this._repository);

  void login(dynamic context) async {
    loadingState(context: context);
    (await _loginUseCase
            .execute(LoginUseCaseInput(email: email!, password: password!)))
        .fold(
      (failure) => {
        errorState(context: context, message: failure.message),
      },
      (data) async => data
          ? {
              await (await _repository.getLoginNextNavigationRoute(context))
                  .fold(
                      (error) =>
                          errorState(context: context, message: error.message),
                      (route) => {
                            hideState(context: context),
                            Navigator.of(context).pushReplacementNamed(route),
                          }),
            }
          : {
              errorState(
                context: context,
              ),
            },
    );
  }
}
