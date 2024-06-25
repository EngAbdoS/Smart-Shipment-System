import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/delivery/main/viewModel/mainDeliveryViewModel.dart';

class DeliveryHomeViewModel extends MainDeliveryViewModel {
  DeliveryHomeViewModel(this._repository, this.userHomeData) : super(_repository);

  UserModel userHomeData;
  final Repository _repository;
  startHomeView(dynamic context) async {




  }




}