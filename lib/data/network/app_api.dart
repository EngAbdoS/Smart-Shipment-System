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

  // @GET("/posts/{id}")
  // Future<Post> getPostFromId(@Path("id") int postId);
  // @GET("/comments?postId={id}")
  // Future<Comment> getCommentFromPostId(@Path("id") int postId);
  @GET("client/order/{id}")
  Future<SearchOrderResponse> getOrderById(@Path("id") String id);




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
      FixedDeliveryRegistrationRequest
      fixedDeliveryRegistrationRequest);


  @PATCH("users/resetPassword")
  Future<ForgetPasswordResponse> resetPassword(
    @Field("otp") String otp,
    @Field("password") String password,
    @Field("passwordConfirm") String passwordConfirm,
  );
}
