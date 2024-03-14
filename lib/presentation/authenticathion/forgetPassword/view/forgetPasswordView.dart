import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/forgetPassword/viewModel/forgetPasswordViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/assets_manager.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/resources/values_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final ForgotPasswordViewModel forgotPasswordViewModel =
      instance<ForgotPasswordViewModel>();
  final TextEditingController _emailController = TextEditingController();

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
                AppStrings.forgetPassword,
                style: Theme.of(context).textTheme.bodyMedium,
              ).tr(),
              const SizedBox(
                height: AppSize.s20 * 3,
              ),
              Image.asset(ImageAssets.forgetPassword),
              //SvgPicture.asset(SVGAssets.forgetPassword),
              const SizedBox(
                height: AppSize.s24,
              ),
              Text(
                AppStrings.emailAssociated,
                style: Theme.of(context).textTheme.bodyMedium,
              ).tr(),
              const SizedBox(
                height: AppSize.s24,
              ),
              emailWidget(),
              const SizedBox(
                height: AppSize.s24,
              ),
              RegularButton(
                buttonAction: () =>
                    forgotPasswordViewModel.forgotPassword(context),
                buttonWidget: Text(
                  AppStrings.reset,
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailWidget() {
    return StreamBuilder<bool>(
        stream: forgotPasswordViewModel.outputIsEmailValid,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: (email) => forgotPasswordViewModel.setEmail(email),
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            decoration: InputDecoration(
              // label: Text(AppStrings.username.tr()),
              hintText: AppStrings.emailHint.tr(),
              labelText: AppStrings.emailHint.tr(),
              errorText:
                  (snapshot.data ?? true) ? null : AppStrings.invalidEmail.tr(),
            ),
          );
        });
  }
}
