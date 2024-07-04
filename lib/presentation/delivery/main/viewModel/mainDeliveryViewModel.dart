import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/chat/view/chatBotView.dart';
import 'package:smart_shipment_system/presentation/delivery/activiesHistory/view/activiesHistoryView.dart';
import 'package:smart_shipment_system/presentation/delivery/home/view/deliveryView.dart';
import 'package:smart_shipment_system/presentation/delivery/tripList/view/tripListView.dart';
import 'package:smart_shipment_system/presentation/delivery/wallet/wallet.dart';
import 'package:smart_shipment_system/presentation/notifications/notificationsScreen.dart';
import 'package:smart_shipment_system/presentation/userProfile/editProfileData/view/editProfileDataView.dart';
import 'package:smart_shipment_system/presentation/userProfile/view/deliveryUserProfile.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/status/hideState.dart';
import '../../../widgets/status/loadingState.dart';

class MainDeliveryViewModel {
  MainDeliveryViewModel(this._repository);

  final Repository _repository;
  UserModel? userModel;
  int pageViewIndex = 0;

  final StreamController _mainStream = BehaviorSubject<Widget?>();
  final StreamController _mainIndexStream = BehaviorSubject<int?>();

  Stream<Widget?> get outputMainStream =>
      _mainStream.stream.map((widget) => widget);

  Stream<int?> get outputMainIndexStream =>
      _mainIndexStream.stream.map((index) => index);

  Sink get inputMainStream => _mainStream.sink;

  Sink get inputMainIndexStream => _mainIndexStream.sink;

  void start(dynamic context) async {
    await changeWidget(context, pageViewIndex);
  }

  Future getUserData(dynamic context) async {
    loadingState(context: context);
    (await _repository.getUserData()).fold(
        (failure) => {
              errorState(context: context, message: failure.message),
            }, (data) {
      userModel = data;
      hideState(context: context);
    });
  }

  changeWidget(dynamic context, int widget) async {
    if (pageViewIndex != widget || widget == 0) {
      switch (widget) {
        case 0:
          {
            await getUserData(context);

            pageViewIndex = widget;
            initDeliveryHomeModule(userModel!);
            inputMainStream.add(const DeliveryHomeView());
            inputMainIndexStream.add(widget);
            break;
          }
        case 1:
          {
            pageViewIndex = widget;
            inputMainStream.add(WalletView(
              user: userModel!,
              profileNavigate: () => changeWidget(context, 3),
            ));
            inputMainIndexStream.add(widget);
            break;
          }
        case 2:
          {
            pageViewIndex = widget;
            initChatModule();
            inputMainStream.add(const ChatBotView());
            inputMainIndexStream.add(widget);
            break;
          }
        case 3:
          {
            await getUserData(context);

            pageViewIndex = widget;
            initClientProfileModule(userModel!);
            inputMainStream.add(const DeliveryUserProfileView());
            inputMainIndexStream.add(widget);
            break;
          }
        case 5:
          {
            await getUserData(context);

            pageViewIndex = widget;
            initEditProfileModule(userModel!);
            inputMainStream.add(const EditProfileView());
            inputMainIndexStream.add(widget);
            break;
          }
        case 6:
          {
            await getUserData(context);

            pageViewIndex = widget;
            initDeliveryTripListModule(userModel!.tripList ?? []);
            inputMainStream.add(TripListView());
            inputMainIndexStream.add(widget);
            break;
          }
        case 7:
          {
            await getUserData(context);
            pageViewIndex = widget;
            initDeliveryActivitiesHistoryModule(userModel!);
            inputMainStream.add(const ActivitiesHistoryView());
            inputMainIndexStream.add(widget);
            break;
          }
        case 8:
          {
            pageViewIndex = widget;
            inputMainStream.add(NotificationsView(
              user: userModel!,
              profileNavigate: () => changeWidget(context, 3),
            ));
            inputMainIndexStream.add(widget);
            break;
          }
      }
    }
  }

  void dispose() {
    _mainStream.close();
    _mainIndexStream.close();
  }
}
