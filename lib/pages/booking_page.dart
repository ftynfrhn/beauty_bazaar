import 'package:beauty_bazaar/components/my_back_button.dart';
import 'package:beauty_bazaar/components/my_button.dart';
import 'package:beauty_bazaar/components/my_textbox.dart';
import 'package:beauty_bazaar/pages/payment_page.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  final Map<String, dynamic> artist;

  const BookingPage({super.key, required this.artist});


  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // final User? currentUser = FirebaseAuth.instance.currentUser;

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  final String _location = ""; // Initialize location string
  final String _contactNo = ""; // Initialize location string

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width - 40;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            const Padding(
              padding: EdgeInsets.only(
                top: 40.0,
                left: 25.0,
              ),
              child: Row(
                children: [
                  MyBackButton(),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Artist name from widget.artist
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Makeup Artist: ${widget.artist['name']}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Price and total after taxes, use widget.artist['price']
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "RM ${widget.artist['price']}",
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Total after taxes",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Date Container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              width: containerWidth,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                children: [
                  const Text(
                    "Book on",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: const Icon(Icons.calendar_today, size: 30),
                      ),

                      const SizedBox(width: 10),

                      Text(
                        "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Time Container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              width: containerWidth,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                children: [
                  const Text(
                    "Time",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _selectTime(context);
                        },
                        child: const Icon(Icons.access_time, size: 30),
                      ),

                      const SizedBox(width: 10),

                      Text(
                        _selectedTime.format(context),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Location 
            MyTextBox(
              sectionName: "Location",
              text: _location.isNotEmpty ? _location : "Enter your address",
              onPressed: () {
                // Implement functionality to edit address if needed
                print("Edit address button pressed");
              },
            ),

            // Contact Number
            MyTextBox(
              sectionName: "Contact No.",
              text: _contactNo.isNotEmpty ? _contactNo : "Enter your contact number",
              onPressed: () {
                // Implement functionality to edit contact number if needed
                print("Edit contact number button pressed");
              },
            ),

            const SizedBox(height: 20),

            // Booking button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: containerWidth,
                child: MyButton(
                  text: "BOOK NOW",
                  onTap: () {
                    // createBookingDocument(currentUser);

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const PaymentPage()),
                    // );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
