import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/changePassword/viewModel/changePasswordViewModel.dart';
import 'package:smart_shipment_system/presentation/authenticathion/forgetPassword/viewModel/forgetPasswordViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/color_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});

  final ChangePasswordViewModel changePasswordViewModel =
      instance<ChangePasswordViewModel>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p18, vertical: AppPadding.p20 * 3.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.changePassword,
                style: Theme.of(context).textTheme.bodyMedium,
              ).tr(),
              const SizedBox(
                height: AppSize.s20 * 3,
              ),
              Image.asset(ImageAssets.changePassword),
              //SvgPicture.asset(SVGAssets.forgetPassword),
              const SizedBox(
                height: AppSize.s24,
              ),
              Text(
                AppStrings.passwordDifferent,
                style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center ,
              ).tr(),
              const SizedBox(
                height: AppSize.s24,
              ),
              passwordWidgets(),
              const SizedBox(
                height: AppSize.s24,
              ),
              RegularButton(
                buttonAction: () =>
                    changePasswordViewModel.changePassword(context),
                buttonWidget: Text(
                  AppStrings.save,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget passwordWidgets() {
    return Column(
      children: [
        StreamBuilder<bool>(
          builder: (context, snapshot) {
            return StreamBuilder<bool>(
                stream: changePasswordViewModel.outputIsPasswordHidden,
                builder: (context, hiddenState) {
                  return TextFormField(
                    onChanged: (password) => {
                      changePasswordViewModel.setPassword(password),
                      changePasswordViewModel.validateConfirmPassword(),
                    },
                    obscureText: hiddenState.data ?? true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            changePasswordViewModel.changePasswordState();
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
          stream: changePasswordViewModel.outputIsPasswordValid,
        ),
        const SizedBox(
          height: AppSize.s28,
        ),
        StreamBuilder<bool>(
          builder: (context, snapshot) {
            return StreamBuilder<bool>(
                stream: changePasswordViewModel.outputIsConfirmPasswordHidden,
                builder: (context, hiddenState) {
                  return TextFormField(
                    onChanged: (confirmPassword) => changePasswordViewModel
                        .setConfirmPassword(confirmPassword),
                    obscureText: hiddenState.data ?? true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            changePasswordViewModel
                                .changeConfirmPasswordState();
                          },
                          icon: Icon(
                            (hiddenState.data ?? true)
                                ? Icons.remove_red_eye_rounded
                                : Icons.remove_red_eye_outlined,
                            color: ColorManager.primary,
                          ),
                        ),
                        hintText: AppStrings.confirmPass.tr(),
                        labelText: AppStrings.confirmPass.tr(),
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.confirmPassError.tr(),
                        errorMaxLines: 2),
                  );
                });
          },
          stream: changePasswordViewModel.outputIsConfirmPasswordValid,
        ),
      ],
    );
  }
}
