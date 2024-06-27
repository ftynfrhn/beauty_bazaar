import 'package:beauty_bazaar/components/my_back_button.dart';
import 'package:beauty_bazaar/components/my_textbox.dart';
import 'package:beauty_bazaar/pages/booking_history_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/*
  ProfilePage
  - user can view and edit their profile details
  - user can view their booking history
*/
class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // user details map to store user details fetched from firestore
  Map<String, dynamic>? userDetails;

  // fetch user details on page load
  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  // method to fetch user details and update userDetails map
  Future<void> getUserDetails() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();

    setState(() {
      userDetails = snapshot.data();
    });
  }

  // edit field and update in firestore and local userDetails map
  Future<void> editField(BuildContext context, String field) async {
    String newValue = "";

    newValue = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Edit $field",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (value) => newValue = value,
        ),
        actions: [
          // cancel button
          TextButton(
            onPressed: () => Navigator.pop(context, ''),
            child: Text(
              "Cancel",
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          // save button
          TextButton(
            child: Text(
              "Save",
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
            ),
            onPressed: () => Navigator.of(context).pop(newValue),
          ),
        ],
      ),
    );

    // update in firestore
    if (newValue.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUser!.email)
          .update({field: newValue});

      // update local userDetails map and refresh UI
      setState(() {
        userDetails![field] = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: userDetails == null
          ? const Center(
              child: CircularProgressIndicator(), // show loading circle if userDetails is null
            )
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    // back button
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

                    const SizedBox(height: 25),

                    // user profile icon
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.person,
                        size: 64,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // user name and email text
                    Text(
                      userDetails!["username"] ?? "N/A",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      userDetails!["email"] ?? "N/A",
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // user details text
                    const Text(
                      'My Details',
                      style: TextStyle(fontSize: 20),
                    ),

                    const SizedBox(height: 10),

                    // username, email, bio
                    MyTextBox(
                      text: userDetails!["username"] ?? "N/A",
                      sectionName: "username",
                      onPressed: () => editField(context, "username"),
                    ),
                    MyTextBox(
                      text: userDetails!["email"] ?? "N/A",
                      sectionName: "email",
                      onPressed: () => editField(context, "email"),
                    ),
                    MyTextBox(
                      text: userDetails!["bio"] ?? "N/A",
                      sectionName: "bio",
                      onPressed: () => editField(context, "bio"),
                    ),

                    const SizedBox(height: 25),

                    // booking history
                    const Text(
                      'My Booking History',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BookingHistoryPage()),
                        );
                      },
                      child: const Text("View Booking History"),
                    ),
                  ],
                ),
              ),
            ),
      );
    }
  }
