import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/view/clientCreateOrderMainView.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/view/orderPaymentView.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/view/recommendedDeliveries.dart';
import 'package:smart_shipment_system/presentation/client/home/view/clientHomeView.dart';
import 'package:smart_shipment_system/presentation/client/shipment/shipmentView.dart';
import 'package:smart_shipment_system/presentation/notifications/notificationsScreen.dart';
import 'package:smart_shipment_system/presentation/userProfile/editProfileData/view/editProfileDataView.dart';
import 'package:smart_shipment_system/presentation/userProfile/view/clientUserProfile.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import '../../../chat/view/chatBotView.dart';
import '../../../widgets/loadingState.dart';

class MainClientViewModel {
  MainClientViewModel(this._repository);

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
    await getUserData(context);

    if (pageViewIndex != widget || widget == 0) {
      switch (widget) {
        case 0:
          {
            pageViewIndex = widget;
            initClientHomeModule(userModel!);
            inputMainStream.add(const ClientHomeView());
            inputMainIndexStream.add(widget);
            break;
          }
        case 1:
          {
            pageViewIndex = widget;
            initClientHomeModule(userModel!);
            inputMainStream.add(ShipmentView());
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
            pageViewIndex = widget;
            initClientProfileModule(userModel!);
            inputMainStream.add(const ClientUserProfileView());
            inputMainIndexStream.add(widget);
            break;
          }
        case 4:
          {
            pageViewIndex = widget;
            initClientAddShipmentModule(userModel!);
            inputMainStream.add(ClientCreateOrderMainView());
            inputMainIndexStream.add(widget);
            break;
          }
        case 5:
          {
            pageViewIndex = widget;
            initEditProfileModule(userModel!);
            inputMainStream.add(const EditProfileView());
            inputMainIndexStream.add(widget);
            break;
          }
        case 6:
          {
            pageViewIndex = widget;
            inputMainStream
                .add(ClientCreateOrderRecommendedDeliveriesMainView());
            inputMainIndexStream.add(widget);
            break;
          }
        case 7:
          {
            pageViewIndex = widget;
            inputMainStream.add(OrderPaymentView());
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
