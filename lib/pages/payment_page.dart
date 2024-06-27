import 'package:beauty_bazaar/components/my_back_button.dart';
import 'package:beauty_bazaar/components/my_button.dart';
import 'package:beauty_bazaar/pages/booking_confirmation_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart'; // package to display credit card form

/*
  PaymentPage
  - user can enter credit card details to pay for the booking
  - user can confirm payment
*/
class PaymentPage extends StatefulWidget {
  // contains booking details
  final Map<String, String> bookingDetails;

  const PaymentPage({Key? key, required this.bookingDetails}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;

  // current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // user details map
  Map<String, dynamic>? userDetails;

  // fetch user details when the page loads
  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  // method to fetch user details
  Future<void> getUserDetails() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();

    setState(() {
      userDetails = snapshot.data();
    });
  }

  // user wants to pay
  void userTappedPay() {
  if (formKey.currentState!.validate()) {

    // only show dialog if form is valid
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Payment"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text("Card Number: $cardNumber"),
              Text("Expiry Date: $expiryDate"),
              Text("Card Holder Name: $cardHolderName"),
              Text("CVV: $cvvCode"),
            ],
          ),
        ),
        actions: [
          // cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          // confirm button
          TextButton(
            onPressed: () async {
              // show loading circle
              showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );

              // Call the function to save booking details
              saveBookingDetails();

              Navigator.pop(context);

              // Check if the widget is still mounted before navigating
              if (mounted) {
                // Navigate to the Booking Confirmation Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookingConfirmationPage(),
                  ),
                );
              }
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }
}

  // save to Bookings collection in Firestore
  Future<void> saveBookingDetails() async {
    try {
      await FirebaseFirestore.instance
          .collection("Bookings")
          .doc(currentUser!.email)
          .collection("UserBookings")
          .doc()
          .set({
        "email": currentUser!.email,
        "username": userDetails!["username"],
        'contactNo': widget.bookingDetails['contactNo'],
        'artistName': widget.bookingDetails['artistName'],
        'price': widget.bookingDetails['price'],
        'date': widget.bookingDetails['date'],
        'time': widget.bookingDetails['time'],
        'location': widget.bookingDetails['location'],
        'payment_status': 'Paid',
      });
      print("Booking details saved successfully!");
    } catch (e) {
      print("Error saving booking details: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Back button row
              const Row(
                children: [
                  MyBackButton(),
                ],
              ),

              const SizedBox(height: 10),

              // Centered page name
              const Center(
                child: Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Credit card widget
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (p0) {},
              ),

              const SizedBox(height: 20),

              // Credit card form
              CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                  });
                },
                formKey: formKey,
              ),

              const SizedBox(height: 40),

              // Pay Now button
              MyButton(
                onTap: userTappedPay,
                text: "Pay Now",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
