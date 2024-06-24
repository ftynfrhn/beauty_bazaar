import 'package:beauty_bazaar/components/my_drawer.dart';
import 'package:beauty_bazaar/pages/booking_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookingPage()),
          );
        },
        child: Icon(Icons.book),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
