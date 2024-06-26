import 'package:flutter/material.dart';

// try
class BookingHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> bookings; // Assuming each booking is represented as a map

  const BookingHistoryPage({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking History'),
      ),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return ListTile(
            title: Text(booking['artistName']),
            subtitle: Text('Date: ${booking['date']}'),
            trailing: Text('RM ${booking['total']}'),
            onTap: () {
              // Implement navigation to detailed booking view if needed
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(); // Navigate back to the previous screen
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
