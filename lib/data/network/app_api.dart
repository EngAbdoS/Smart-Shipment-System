import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/data/response/response.dart';


part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl) //annotation
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio , {String baseUrl}) = _AppServiceClient;

  @POST("users/login")
  Future<AuthenticationResponse> login(
      @Field("email") String email, @Field("password") String password);

}
