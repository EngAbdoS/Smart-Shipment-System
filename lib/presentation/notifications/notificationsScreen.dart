import 'package:flutter/material.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/presentation/widgets/customSliverAppBar.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/status/emptyListWidget.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView(
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
            title: AppStrings.notifications,
            profileNavigate: profileNavigate),
        SliverList(
          delegate: SliverChildListDelegate(
            [emptyListWidget(context, message: AppStrings.no_notifications)],
          ),
        ),
      ],
    );
  }
}
