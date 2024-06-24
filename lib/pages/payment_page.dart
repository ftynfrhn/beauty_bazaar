// import 'package:beauty_bazaar/components/my_back_button.dart';
// import 'package:beauty_bazaar/components/my_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';

// class PaymentPage extends StatefulWidget {
//   const PaymentPage({super.key});

//   @override
//   State<PaymentPage> createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   String cardNumber = "";
//   String expiryDate = "";
//   String cardHolderName = "";
//   String cvvCode = "";
//   bool isCvvFocused = false;

//   // user wants to pay
//   // void userTappedPay() {
//   //   if (formKey.currentState!.validate()) {
//   //     // only show dialog if form is valid
//   //     showAboutDialog(
//   //       context: context,
//   //       builder: (context) => AlertDialog(
//   //         title: const Text("Confirm Payment"),
//   //         content: SingleChildScrollView(
//   //           child: ListBody(
//   //             children: const [
//   //               Text("Card Number: " $cardNumber),
//   //               Text("Expiry Date: " $expiryDate),
//   //               Text("Card Holder Name: ") $cardHolderName),
//   //               Text("CVV: " $cvvCode),
//   //             ],
//   //           ),
//   //         ),
//   //         actions: [
//   //           // confirm button
//   //           TextButton(
//   //             onPressed: () => Navigator.push(
//   //               context,
//   //               MaterialPageRoute(
//   //                 builder: (context) => ReceiptPage(),
//   //               ),
//   //             child: const Text("Confirm"),
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     );
//   //   }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       body:  Padding(
//         padding: const EdgeInsets.only(top: 40.0, left: 25.0, right: 25.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Back button row
//             const Row(
//               children: const [
//                 MyBackButton(),
//               ],
//             ),

//             const SizedBox(height: 10),

//             // Centered page name
//             const Center(
//               child: Text(
//                 "Checkout",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             // credit card packages (flutter pub add flutter_credit_card)
//             CreditCardWidget(
//               cardNumber: cardNumber, 
//               expiryDate: expiryDate, 
//               cardHolderName: cardHolderName, 
//               cvvCode: cvvCode, 
//               showBackView: isCvvFocused, 
//               onCreditCardWidgetChange: (p0) {},
//             ),

//             // credit card form
//             CreditCardForm(
//               cardNumber: cardNumber, 
//               expiryDate: expiryDate, 
//               cardHolderName: cardHolderName, 
//               cvvCode: cvvCode, 
//               onCreditCardModelChange: (data) {
//                 setState(() {
//                   cardNumber = data.cardNumber;
//                   expiryDate = data.expiryDate;
//                   cardHolderName = data.cardHolderName;
//                   cvvCode = data.cvvCode;
//                 });
//               }, 
//               formKey: formKey
//             ),

//             const Spacer(),

//             // MyButton(
//             //   onTap: userTappedPay,
//             //   text: "Pay Now",
//             // ),

//             const SizedBox(height: 25),
//           ],
//         ),
//       ),
//     );
//   }
// }
