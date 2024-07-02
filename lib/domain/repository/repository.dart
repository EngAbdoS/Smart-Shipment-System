import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/data/network/failure.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/data/response/response.dart';
import 'package:smart_shipment_system/domain/entities/deliveryOrderIntity.dart';
import 'package:smart_shipment_system/domain/entities/recomendedDeliveryEntity.dart';
import 'package:smart_shipment_system/domain/models/message.dart';
import 'package:smart_shipment_system/domain/models/shipmentModel.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';

abstract class Repository {
  Future<Either<Failure, String>> getSplashNextNavigationRoute(dynamic context);

  Future<Either<Failure, String>> getLoginNextNavigationRoute(dynamic context);

  Future<Either<Failure, UserModel>> getUserData();

  Future<Either<Failure, Message>> chatBot(String message);

  Future<Either<Failure, bool>> updateUserProfileImage(
      String profileImage, String email);

  Future<Either<Failure, UserModel>> updateUserData(Map<String, dynamic> data);

  Future<Either<Failure, List<ShipmentModel>>> getAllShipment();

  Future<Either<Failure, ShipmentModel>> getShipmentById(String id);

  Future<Either<Failure, ShipmentModel>> createShipment(
      CreateShipmentRequest createShipmentRequest);

  Future<Either<Failure, CheckoutResponse>> checkOutShipmentById(String id);

  Future<Either<Failure, RegistrationResponse>> cancelOrderById(String id);

  Future<Either<Failure, List<RecommendedDeliveryEntity>>>
      getRecommendedDeliveries(String orderStartState, String orderEndState);

  Future<Either<Failure, bool>> deliveryChangeOrderState(
      String id, String status);

  Future<Either<Failure, bool>> clientAssignOrderToDelivery(String orderId,List<String> deliveryId);

  Future<Either<Failure, List<DeliveryOrderEntity>>> deliveryGetOrders(int pageIndex);

  Future<Either<Failure, bool>> updateDeliveryTripList(
      UpdateDeliveryTripListRequest updateDeliveryTripListRequest);

  Future<Either<Failure, bool>> deleteDeliveryTripList(int index);

  Future<Either<Failure, List<ShipmentModel>>> getAllComingOrders();

  Future<Either<Failure, bool>> login(LoginRequest loginRequest);

  Future<Either<Failure, bool>> clientRegistration(
      ClientRegistrationRequest clientRegistrationRequest);

  Future<Either<Failure, bool>> emailVerification(
      EmailVerificationRequest emailVerificationRequest);

  Future<Either<Failure, bool>> forgetPassword(String email);

  Future<Either<Failure, bool>> unorganizedDeliveryRegistration(
      UnorganizedDeliveryRegistrationRequest
          unorganizedDeliveryRegistrationRequest);

  Future<Either<Failure, bool>> fixedDeliveryRegistration(
      FixedDeliveryRegistrationRequest fixedDeliveryRegistrationRequest);

  Future<Either<Failure, bool>> resetPassword(
      ResetPasswordRequest resetPasswordRequest);

  void logout();
}
