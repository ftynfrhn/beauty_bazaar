import 'package:flutter/material.dart';
import 'package:beauty_bazaar/pages/booking_page.dart';

class ArtistProfile extends StatelessWidget {
  final Map<String, dynamic> artist;

  const ArtistProfile({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    double rating = artist['rating'] ?? 0.0; // Default to 0.0 if rating is not provided
    int reviewsCount = artist['reviews'] ?? 0; // Default to 0 if reviews count is not provided

    return Scaffold(
      appBar: AppBar(
        title: Text(artist['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              artist['image'],
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Text(
              artist['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              artist['location'],
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              artist['availability'],
              style: TextStyle(
                fontSize: 16,
                color: artist['availability'] == 'Available'
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Services: ${artist['services'].join(', ')}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Price: RM${artist['price']}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to BookingPage and pass the artist data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingPage(artist: artist),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Book',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 24,
                ),
                Text(
                  rating.toStringAsFixed(1), // Display rating with one decimal place
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4.0),
                Text(
                  '($reviewsCount Reviews)',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
