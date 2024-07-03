import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/data/network/requests.dart';
import 'package:smart_shipment_system/data/response/response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl) //annotation
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("users/me")
  Future<MeDataResponse> getUserData();

  @GET("client/order/getAllOrders")
  Future<OrdersResponse> getAllOrders();

  @GET("client/order/{id}")
  Future<SearchOrderResponse> getOrderById(@Path("id") String id);

  @DELETE("client/order/{id}")
  Future<RegistrationResponse> deleteOrderById(@Path("id") String id);

  @POST("client/order/createOrder")
  Future<CreatedOrderResponse> createShipment(
      @Body() CreateShipmentRequest createShipmentRequest);

  @PATCH("client/order/{id}/cancel")
  Future<RegistrationResponse> cancelOrderById(@Path("id") String id);

  @POST("client/order/{id}/checkout")
  Future<CheckoutResponse> checkoutOrderById(@Path("id") String id);

  @GET("delivery/order/summary?coming=true")
  Future<DeliveryOrdersResponse> getAllComingOrders();

  @GET("delivery/order/summary?delivered=true")
  Future<DeliveryOrdersResponse> getAllDeliveredOrders();

  @GET(
      "client/order/findPath?orderStartState={orderStartState}&orderEndState={orderEndState}")
  Future<RecommendedDeliveriesResponse> getDeliveryPath(
      @Path("orderStartState") String orderStartState,
      @Path("orderEndState") String orderEndState);

  @GET(
      "client/order/nearestUnOrganizedDelivery?currentLocation={currentLocationLat},{currentLocationLng}&maxDis={maxDis}")
  Future<NearestDeliveryResponse> getAllNearestUnOrganizedDelivery(
      @Path("currentLocationLat") double currentLocationLat,
      @Path("currentLocationLng") double currentLocationLng,
      @Path("maxDis") int maxDis);

  @GET(
      "client/order/nearestDelivery?startLocation={startLocationLat},{startLocationLng}&endLocation={endLocation}&maxDis={maxDis}")
  Future<NearestDeliveryResponse> getAllNearestDelivery(
      @Path("startLocationLat") double startLocationLat,
      @Path("startLocationLng") double startLocationLng,
      @Path("endLocation") String endLocation,
      @Path("maxDis") int maxDis);

  @PATCH('users/updateMe')
  Future<MeDataResponse> updateUserData(@Body() Map<String, dynamic> data);

  @PATCH('users/updateImg')
  Future<RegistrationResponse> updateUserProfileImage(
      @Field("profileImage") String profileImage);

  @PATCH('delivery/order/{id}?status={status}')
  Future<RegistrationResponse> deliveryChangeOrderState(
      @Path("id") String id, @Path("status") String status);

  @PATCH('delivery/order/{order_id}/assignToMe?delivery={delivery_id}')
  Future<RegistrationResponse> clientAssignOrderDelivery(
      @Path("order_id") String orderId, @Path("delivery_id") String deliveryId);

  @GET('delivery/order/summary?limit=10&page={pageIndex}')
  Future<DeliveryOrdersResponse> deliveryGetOrders(
      @Path("pageIndex") int pageIndex);

  @PATCH('delivery/addTrip')
  Future<RegistrationResponse> updateDeliveryTripList(
      @Body() UpdateDeliveryTripListRequest updateDeliveryTripListRequest);

  @DELETE('delivery/deleteTrip/{index}')
  Future<RegistrationResponse> deleteDeliveryTripList(@Path("index") int index);

  @POST("users/login")
  Future<AuthenticationResponse> login(
      @Field("email") String email, @Field("password") String password);

  @POST("users/signup")
  Future<RegistrationResponse> clientRegistration(
    @Field("name") String name,
    @Field("email") String email,
    @Field("phone") String phone,
    @Field("password") String password,
    @Field("passwordConfirm") String passwordConfirm,
    @Field("role") String role,
  );

  @POST("users/confirmAccount")
  Future<EmailVerificationResponse> emailVerification(
    @Field("email") String email,
    @Field("otp") String otp,
  );

  @POST("users/forgetPassword")
  Future<ForgetPasswordResponse> forgetPassword(
    @Field("email") String email,
  );

  @POST("users/signup")
  Future<RegistrationResponse> unorganizedDeliveryRegistration(
      @Body()
      UnorganizedDeliveryRegistrationRequest
          unorganizedDeliveryRegistrationRequest);

  @POST("users/signup")
  Future<RegistrationResponse> fixedDeliveryRegistration(
      @Body()
      FixedDeliveryRegistrationRequest fixedDeliveryRegistrationRequest);

  @PATCH("users/resetPassword")
  Future<ForgetPasswordResponse> resetPassword(
    @Field("otp") String otp,
    @Field("password") String password,
    @Field("passwordConfirm") String passwordConfirm,
  );
}
