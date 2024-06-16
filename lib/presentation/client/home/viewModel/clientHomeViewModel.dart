import 'package:go_router/go_router.dart';
import 'package:smart_shipment_system/domain/models/userModel.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/widgets/errorState.dart';
import 'package:smart_shipment_system/presentation/widgets/hideState.dart';
import 'package:smart_shipment_system/presentation/widgets/loadingState.dart';

class ClientHomeViewModel {
  ClientHomeViewModel(this._repository);

  final Repository _repository;

  UserModel? userModel;


   userData(dynamic context) async {
    loadingState(context: context);
    (await _repository.getUserData()).fold(
        (failure) => {
              errorState(context: context, message: failure.message),
            }, (data) {
      userModel = data;
      hideState(context: context);
    });
  }
}
