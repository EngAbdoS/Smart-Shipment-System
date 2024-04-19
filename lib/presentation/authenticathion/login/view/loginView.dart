import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/login/ViewModel/loginViewModel.dart';

import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/auth_logo_widget.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainLoginWidget(context),
    );
    // return BlocBuilder<LoginCubit, LoginCubitStates>(builder: (context, state) {
    //   final loginCubit = context.read<LoginCubit>();
    //
    //   if (state is LoginInitial) {
    //     return Scaffold(
    //       body: mainLoginWidget(context, loginCubit),
    //     );
    //   } else if (state is LoginLoading) {
    //     testState(context);
    //     return Container();
    //   } else if (state is LoginSuccess) {
    //     return Container();
    //   } else {
    //     return const Text("a7a");
    //   }
    // });
  }

  SingleChildScrollView mainLoginWidget(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              authLogoWidget(),
              Text(
                AppStrings.welcomeLogin,
                style: Theme.of(context).textTheme.bodyMedium,
              ).tr(),
              const SizedBox(
                height: AppSize.s18 * 2,
              ),
              StreamBuilder<bool>(
                  stream: _viewModel.outputIsEmailValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      onChanged: (email) => _viewModel.setEmail(email),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                        // label: Text(AppStrings.username.tr()),
                        hintText: AppStrings.emailHint.tr(),
                        labelText: AppStrings.emailHint.tr(),
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.invalidEmail.tr(),
                      ),
                    );
                  }),
              const SizedBox(
                height: AppSize.s28,
              ),
              StreamBuilder<bool>(
                builder: (context, snapshot) {
                  return StreamBuilder<bool>(
                      stream: _viewModel.outputIsPasswordHidden,
                      builder: (context, hiddenState) {
                        return TextFormField(
                          onChanged: (password) =>
                              _viewModel.setPassword(password),
                          obscureText: hiddenState.data ?? true,
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _viewModel.changePasswordState();
                                },
                                icon: Icon(
                                  (hiddenState.data ?? true)
                                      ? Icons.remove_red_eye_rounded
                                      : Icons.remove_red_eye_outlined,
                                  color: ColorManager.primary,
                                ),
                              ),
                              hintText: AppStrings.password.tr(),
                              labelText: AppStrings.password.tr(),
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStrings.passwordInvalid.tr(),
                              errorMaxLines: 2),
                        );
                      });
                },
                stream: _viewModel.outputIsPasswordValid,
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.forgetPassword,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: ColorManager.black),
                    ).tr(),
                    TextButton(
                      onPressed: () => GoRouter.of(context)
                          .pushReplacement(Routes.forgotPasswordViewRoute),
                      child: Text(
                        AppStrings.reset,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: ColorManager.black,
                              decoration: TextDecoration.underline,
                            ),
                      ).tr(),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              RegularButton(
                buttonAction: () => _viewModel.getLoading(context),
                buttonWidget: Text(
                  AppStrings.signIn,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.doNotAcc,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: ColorManager.black),
                    ).tr(),
                    TextButton(
                      onPressed:()=>GoRouter.of(context).push(Routes.authViewRoute),
                      child: Text(
                        AppStrings.signUn,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: ColorManager.black,
                              decoration: TextDecoration.underline,
                            ),
                      ).tr(),
                    )
                  ],
                ),
              ),

              // TextButton(onPressed: _viewModel.loading(), child: Text("a7a"))
            ],
          ),
        ),
      ),
    );
  }
}
