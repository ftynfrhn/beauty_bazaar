// booking_history_page.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({super.key});

  Future<List<Map<String, dynamic>>> fetchBookings() async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection("Bookings")
        .doc(currentUser!.email)
        .collection("UserBookings")
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking History"),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchBookings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error fetching bookings"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No bookings found"));
          }

          final bookings = snapshot.data!;

          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final booking = bookings[index];
              return ListTile(
                title: Text("Artist: ${booking['artistName']}"),
                subtitle: Text("Date: ${booking['date']} - Time: ${booking['time']}"),
                trailing: Text("Price: ${booking['price']}"),
              );
            },
          );
        },
      ),
    );
  }
}
