import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Custom drawer widget
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  // method to logout using Firebase Auth
  void logout(){
    FirebaseAuth.instance.signOut();
  }
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header
              DrawerHeader(
                child: Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

            const SizedBox(height: 25),

            // home tile
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: const Text("H O M E"),
                onTap: () {
                  // this is already the home screen, so just the drawer
                  Navigator.pop(context);
                },
              ),
            ),

            // profile tile
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: const Text("P R O F I L E"),
                onTap: () {
                  // pop drawer
                  Navigator.pop(context);

                  // navigate to profile page
                  Navigator.pushNamed(context, '/profile_page');
                },
              ),
            ),

          ],
        ),

          // logout tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: const Text("L O G O U T"),
              onTap: () {
                // pop drawer
                Navigator.pop(context);

                // call logout method
                logout();
              },
            ),
          ),

        ],
      )
    );
  }
}