import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smart_shipment_system/app/dependancy_injection.dart';
import 'package:smart_shipment_system/presentation/authenticathion/widgets/registrationSlider.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/viewModel/clientCreateOrderViewModel.dart';
import 'package:smart_shipment_system/presentation/client/createOrder/widgets/paymentWidget.dart';
import 'package:smart_shipment_system/presentation/client/main/viewModel/mainClientViewModel.dart';
import 'package:smart_shipment_system/presentation/resources/strings_manager.dart';
import 'package:smart_shipment_system/presentation/widgets/regular_button.dart';


class OrderPaymentView extends StatefulWidget {
  OrderPaymentView({super.key});

  @override
  State<OrderPaymentView> createState() => _OrderPaymentViewState();
}

class _OrderPaymentViewState extends State<OrderPaymentView> {
   final ClientCreateOrderViewModel _viewModel = instance<ClientCreateOrderViewModel>();
  final _formKey = GlobalKey<FormState>();

  //final controller = CardFormEditController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController cardHolderNameController = TextEditingController();

  //
  // @override
  // void initState() {
  //   Stripe.instance
  //       .initPaymentSheet(
  //       paymentSheetParameters: SetupPaymentSheetParameters(
  //         // paymentIntentClientSecret: paymentIntent!['client_secret'],
  //           style: ThemeMode.dark,
  //           merchantDisplayName: 'merchant name',
  //           //  customerId: paymentIntent!['customer'],
  //           // customerEphemeralKeySecret: paymentIntent!['ephemeralKey'],
  //
  //           //If the store the customer the billing details
  //           billingDetails: BillingDetails()
  //       ));
  //  // controller.addListener(update);
  //   super.initState();
  // }
  //
  // void update() => setState(() {});
  // Map<String, dynamic>? paymentIntentData;
  // createPaymentIntent(String amount,String currency) async {
  //   try {
  //     Map<String, dynamic> body = {
  //       'amount': 5,
  //       'currency': currency,
  //       'payment_method_types[]': 'card'
  //     };
  //   }
  //   catch(error)
  //   {
  //
  //
  //   };

  // var response = await http.post(
  //     Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //     body: body,
  //     headers: {
  //       'Authorization': 'Bearer Put_Your_Seceret_Here',
  //       'Content-Type': 'application/x-www-form-urlencoded'
  //     });
  //   try {
  //     paymentIntent = json.decode(r);
  //     //Payment Sheet
  //     if(paymentIntent !=null){
  //       await Stripe.instance
  //           .initPaymentSheet(
  //           paymentSheetParameters: SetupPaymentSheetParameters(
  //               paymentIntentClientSecret: paymentIntent!['client_secret'],
  //               style: ThemeMode.dark,
  //               merchantDisplayName: 'merchant name',
  //               customerId: paymentIntent!['customer'],
  //               customerEphemeralKeySecret: paymentIntent!['ephemeralKey'],
  //
  //               //If the store the customer the billing details
  //               billingDetails: BillingDetails()
  //           ));
  //       displayPaymentSheet();
  //     }
  //   } catch (e, s) {
  //     Get.snackbar("Error", "$e");
  //   }
  // } catch (err) {
  //   debugPrint(err.toString());
  // }
  // }
  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        //  Get.snackbar("Payment", "Payment successful", snackPosition: SnackPosition.BOTTOM);        debugPrint();
        // paymentIntent = null;
      }).onError((error, stackTrace) {
        // Get.snackbar("Payment", "Payment flow has been cancelled", snackPosition: SnackPosition.BOTTOM);        Utils.showMessage(LocaleKeys.payment.tr, LocaleKeys.paymentCancelled.tr);
      });
    } on StripeException {
      // Get.snackbar("Payment", "Payment flow has been cancelled", snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      //Get.snackbar("Error", "$e", snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 84.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.add_shipment,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium,
                ).tr().animate(delay: 300.milliseconds).fade(
                    duration: 300.milliseconds,
                    curve: Curves.fastEaseInToSlowEaseOut),
                const RegistrationSlider(pageIndex: 3),
                SizedBox(height: 25.h),

                ElevatedButton(
                  onPressed: () => Stripe.instance.presentPaymentSheet(),
                  child: Text("Pay"),
                ),
                //  paymentWidget(context),
                // CardField(
                //   onCardChanged: (card) {
                //     print(card?.number??"a7a");
                //     // setState(() {
                //     //   _card = card;
                //     // });
                //   },
                // ),
                SizedBox(height: 25.h),


                RegularButton(buttonAction: () async =>
                //var paymentIntent = json.decode('');

                await Stripe.instance.presentPaymentSheet()


                    , buttonWidget: Text("jfsejrgb"))

                // Container(
                //   color: Colors.green,
                //   child: CardFormField(
                //     controller: controller,
                //
                //
                //
                //   ),
                // ),
                //
                ,
                //CardFormFieldd(),
                // CardFormFieldd(  cardNumberController: cardNumberController,
                //   expiryDateController: expiryDateController,
                //   cvvController: cvvController,
                //   cardHolderNameController: cardHolderNameController,),
                // if(controller.details.complete == true)
                //   ElevatedButton(
                //     onPressed: (){},
                //     child: Text('Pay'),
                //   )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
