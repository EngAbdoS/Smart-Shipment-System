import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/data/network/failure.dart';

abstract class BaseUseCase<In,Out>//generic data type
{
  Future<Either<Failure,Out>>execute(In input);//[In input] to be optional


}
class NoParam{}