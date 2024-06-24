// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ArtistProfile extends StatelessWidget {
  final Map<String, dynamic> artist;

  const ArtistProfile({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artist['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              artist['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(artist['location']),
            SizedBox(height: 8.0),
            Text('Services: ${artist['services'].join(', ')}'),
            SizedBox(height: 8.0),
            Text('Availability: ${artist['availability']}'),
          ],
        ),
      ),
    );
  }
}
