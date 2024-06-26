import 'package:beauty_bazaar/components/my_back_button.dart';
import 'package:beauty_bazaar/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:beauty_bazaar/pages/booking_page.dart';

class ArtistProfile extends StatelessWidget {
  final Map<String, dynamic> artist;

  const ArtistProfile({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double rating = artist['rating'] ?? 0.0; // Default to 0.0 if rating is not provided

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button and artist name
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 25.0),
              child: Row(
                children: [
                  MyBackButton(),
                  const SizedBox(width: 80.0),
                  Text(
                    "${artist['name']}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            // Rest of the artist profile content
            Padding(
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
                    child: MyButton(
                      text: 'BOOK ',
                      onTap: () {
                        // Navigate to BookingPage and pass the artist data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingPage(artist: artist),
                          ),
                        );
                      },
                      // child: const Padding(
                      //   padding: EdgeInsets.symmetric(vertical: 12.0),
                      //   child: Text(
                      //     'Book',
                      //     style: TextStyle(
                      //       fontSize: 20,
                      //     ),
                      //   ),
                      // ),
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
                        '(${artist['reviewsCount']} Reviews)',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
