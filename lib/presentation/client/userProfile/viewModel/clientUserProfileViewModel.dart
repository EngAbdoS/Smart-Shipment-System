import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';

class ClientUserProfileViewModel //extends MainClientViewModel
{
  ClientUserProfileViewModel(this._repository,this.userProfileData); //: super(_repository) ;

  final Repository _repository;

  UserModel userProfileData;





}