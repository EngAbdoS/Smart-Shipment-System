import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/data/network/app_api.dart';
import 'package:smart_shipment_system/presentation/authenticathion/login/ViewModel/loginViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/authWidgets.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/auth_logo_widget.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';
import 'package:smart_shipment_system/presentation/widgets/toast.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final AppServiceClient client = instance<AppServiceClient>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainLoginWidget(context),
    );
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
              authLogoWidget(height: 150)
                  .animate()
                  .shake(curve: Curves.bounceInOut),
              Text(
                AppStrings.welcomeLogin,
                style: Theme.of(context).textTheme.bodyMedium,
              ).tr().animate(delay: 300.milliseconds).fade(
                  duration: 300.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),
              SizedBox(
                height: 40.sp,
              ),

              emailInputWidget(_viewModel.outputIsEmailValid,
                      _viewModel.setEmail, _emailController)
                  .animate()
                  .slideX(begin: 0.25, end: 0.0, curve: Curves.easeOut),
              SizedBox(
                height: 28.sp,
              ),
              passwordInputWidget(
                      _viewModel.outputIsPasswordHidden,
                      _viewModel.setPassword,
                      () {},
                      _passwordController,
                      _viewModel.changePasswordState,
                      _viewModel.outputIsPasswordValid)
                  .animate()
                  .slideX(begin: -0.25, end: 0.0, curve: Curves.easeOut),

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
              ).animate(delay: 300.milliseconds).fade(
                  duration: 300.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),
              SizedBox(
                height: 28.sp,
              ),

              StreamBuilder<bool>(
                  stream: _viewModel.outputAreAllLoginDataValid,
                  builder: (context, snapshot) {
                    return RegularButton(

                      buttonAction: (snapshot.data ?? false)
                          ? () => _viewModel.getLoading(context)
                          : () => toastWidget(
                              AppStrings.validateDeliveryTripInputToast),
                      buttonWidget: Text(
                        AppStrings.signIn,
                        style: Theme.of(context).textTheme.titleMedium,
                      ).tr(),
                    ).animate(delay: 300.milliseconds).fade(
                        duration: 300.milliseconds,
                        curve: Curves.fastEaseInToSlowEaseOut);
                  }),
              // RegularButton(
              //   buttonAction: () => _viewModel.getLoading(context),
              //   buttonWidget: Text(
              //     AppStrings.signIn,
              //     style: Theme.of(context).textTheme.titleMedium,
              //   ).tr(),
              // ).animate(delay: 300.milliseconds).fade(
              //     duration: 300.milliseconds,
              //     curve: Curves.fastEaseInToSlowEaseOut),
              SizedBox(
                height: 28.sp,
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
                      onPressed: () =>
                          GoRouter.of(context).push(Routes.authViewRoute),
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
              ).animate(delay: 300.milliseconds).fade(
                  duration: 300.milliseconds,
                  curve: Curves.fastEaseInToSlowEaseOut),

              // TextButton(onPressed: _viewModel.loading(), child: Text("a7a"))
            ],
          ),
        ),
      ),
    );
  }
}
