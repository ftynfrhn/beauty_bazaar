import 'package:beauty_bazaar/components/my_button.dart';
import 'package:flutter/material.dart';

// This page is displayed when the booking is successful. It shows a message
class BookingConfirmationPage extends StatelessWidget {
  const BookingConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Booking Successful",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Display a green checkmark icon
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),

            const SizedBox(height: 20),

            const Text(
              "Your booking has been successfully processed.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            // Button to go back to the home page
            MyButton(
              text: 'Back to Home',
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home_page',
                  (route) => false, // Remove all existing routes
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
