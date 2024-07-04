import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/presentation/widgets/customSliverAppBar.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/status/emptyListWidget.dart';

class WalletView extends StatelessWidget {
  const WalletView(
      {super.key, required this.user, required this.profileNavigate});

  final UserModel user;
  final GestureTapCallback profileNavigate;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        customSliverAppBar(
            context: context,
            user: user,
            title: AppStrings.my_wallet,
            profileNavigate: profileNavigate),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              emptyListWidget(context,
                  message: "${AppStrings.wallet_balance.tr()}  _ "),
            ],
          ),
        ),
      ],
    );
  }
}
