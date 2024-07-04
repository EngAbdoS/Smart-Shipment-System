import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smart_shipment_system/domain/repository/repository.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';

class PaymentViewModel {

  final String paymentIntentClientSecret;
  final Repository _repository;

  PaymentViewModel(this._repository, this.paymentIntentClientSecret);

  Future<void> initPaymentSheet(dynamic context) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: AppStrings.tripleS,
          paymentIntentClientSecret: paymentIntentClientSecret,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      rethrow;
    }
  }
}
