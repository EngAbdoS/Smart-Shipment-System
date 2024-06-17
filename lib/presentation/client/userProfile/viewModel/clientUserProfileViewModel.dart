import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/resources/router_manager.dart';

class ClientUserProfileViewModel //extends MainClientViewModel
{
  ClientUserProfileViewModel(this._repository,this.userProfileData); //: super(_repository) ;

  final Repository _repository;

  UserModel userProfileData;



void logout(dynamic context) {
  _repository.logout();
  GoRouter.of(context).pushReplacement(Routes.loginViewRoute);
}
}