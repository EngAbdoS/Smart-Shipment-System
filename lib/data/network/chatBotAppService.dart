import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:smart_shipment_system/app/app_constants.dart';
import 'package:smart_shipment_system/data/response/response.dart';
part 'chatBotAppService.g.dart';

@RestApi(baseUrl: AppConstants.chatBotBaseUrl) //annotation
abstract class ChatBotAppServiceClient {
  factory ChatBotAppServiceClient(Dio dio, {String baseUrl}) =
      _ChatBotAppServiceClient;

  @POST("/chat-messages")
  Future<ChatBotResponse> deleteOrderById(@Field('user') String user,
      @Field('query') String query, @Field('inputs') Map m);
}
