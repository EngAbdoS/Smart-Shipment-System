import 'package:dartz/dartz.dart';
import 'package:smart_shipment_system/data/network/failure.dart';

abstract class Repository{

  Future<Either<Failure,String>> getSplashNextNavigationRoute();


}