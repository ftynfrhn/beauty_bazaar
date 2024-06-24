import 'package:cloud_firestore/cloud_firestore.dart';

class BookingFirestore{
  // get collection of bookings
  final CollectionReference bookings = FirebaseFirestore.instance.collection("Bookings");

  // save booking to firestore
  Future<void> saveBookingToDatabase(String invoice) async {
    await bookings.add({
      'date': DateTime.now(),
      'booking_details': bookings,
      'payment_status': 'Successful',
  });
  }
}