// //
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_stripe/flutter_stripe.dart';
// //
// // Widget paymentWidget(BuildContext context) {
// // // final data = await _createTestPaymentSheet();
// //
// //    Stripe.instance.initPaymentSheet(
// //     paymentSheetParameters: SetupPaymentSheetParameters(
// //       // Set to true for custom flow
// //       customFlow: false,
// //       // Main params
// //       merchantDisplayName: 'Flutter Stripe Store Demo',
// //      // paymentIntentClientSecret: data['paymentIntent'],
// //       // Customer keys
// //      // customerEphemeralKeySecret: data['ephemeralKey'],
// //      // customerId: data['customer'],
// //       // Extra options
// //
// //       googlePay: const PaymentSheetGooglePay(
// //         merchantCountryCode: 'US',
// //         testEnv: true,
// //       ),
// //       style: ThemeMode.dark,
// //     ),
// //   );
// //
// //   return Container();
// // }
// //
// //
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:flutter/material.dart';
//
// class CardFormFieldd extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//   decoration: BoxDecoration(
//   borderRadius: BorderRadius.circular(10)
//
//   ),
//
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               CardField(
//                 decoration: InputDecoration(
//                   labelText: 'Card Details',
//                   border: OutlineInputBorder(),
//                 ),
//                 style: TextStyle(color: Colors.black),
//                 cursorColor: Colors.black,
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () async {
//                   // Get the card details from the card field
//                   CardFieldInputDetails? card = await const CardFieldInputDetails(complete: true);
//                   if (card != null && card.complete) {
//                     // Handle the card details (e.g., send them to your backend)
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text('Card details complete!'),
//                     ));
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text('Please complete the card details'),
//                     ));
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//
//     );
//   }
// }
import 'package:flutter/material.dart';

class CardFormFieldd extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;
  final TextEditingController cardHolderNameController;

  CardFormFieldd({
    Key? key,
    required this.cardNumberController,
    required this.expiryDateController,
    required this.cvvController,
    required this.cardHolderNameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Card Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: expiryDateController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: cvvController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: cardHolderNameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Cardholder Name',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
