// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:beauty_bazaar/components/my_drawer.dart';
import 'package:beauty_bazaar/pages/artist_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BeautyBazaar'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: <Widget>[
          SearchBar(),
          SizedBox(height: 12.0),
          Expanded(
            child: NearbyArtistsList(),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InputDecorator(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Search for makeup artists',
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
        ),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                setState(() {});
                // Implement filtering logic based on selected value
                // For example, filter nearby artists based on location, availability, or services
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Location',
                  child: Text('Location'),
                ),
                const PopupMenuItem<String>(
                  value: 'Services',
                  child: Text('Services'),
                ),
                const PopupMenuItem<String>(
                  value: 'Availability',
                  child: Text('Availability'),
                ),
              ],
              tooltip: 'Filter',
            ),
          ],
        ),
      ),
    );
  }
}

class NearbyArtistsList extends StatelessWidget {
  const NearbyArtistsList({Key? key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for makeup artists
    final List<Map<String, dynamic>> artists = [
      {
        'image': 'lib/images/sofea.jpeg',
        'name': 'Sofea Jane',
        'location': 'Shah Alam, Selangor',
        'services': ['Professional Photoshoot Makeup'],
        'price': '250',
        'availability': 'Available',
        'rating': 4.5, // Add rating for Sofea Jane
        'reviewsCount': 20,
      },
      {
        'image': 'lib/images/arissa.jpeg',
        'name': 'Arissa Zahra',
        'location': 'Shah Alam, Selangor',
        'services': ['Graduation Makeup'],
        'price': '150',
        'availability': 'Booked until July 2024',
        'rating': 4.0, // Add rating for Arissa Zahra
        'reviewsCount': 11,
      },
      {
        'image': 'lib/images/joy.webp',
        'name': 'Joy Reece',
        'location': 'Kajang, Selangor',
        'services': ['Wedding Makeup'],
        'price': '450',
        'availability': 'Booked until July 2024',
        'rating': 3.8, // Add rating for Joy Reece
        'reviewsCount': 27,
      },
      {
        'image': 'lib/images/diana.jpeg',
        'name': 'Diana Akma',
        'location': 'Kuala Lumpur',
        'services': ['Glamour Event Makeup'],
        'price': '200',
        'availability': 'Booked until July 2024',
        'rating': 4.2, // Add rating for Diana Akma
        'reviewsCount': 14,
      },
      {
        'image': 'lib/images/ridz.jpeg',
        'name': 'RidzuanRadzi',
        'location': 'Taiping, Perak',
        'services': ['Special Effects Makeup', 'Theatrical Makeup'],
        'price': '400',
        'availability': 'Available',
        'rating': 4.7, // Add rating for RidzuanRadzi
        'reviewsCount': 38,
      },
      {
        'image': 'lib/images/att.png',
        'name': 'AttYourService',
        'location': 'Kuala Lumpur',
        'services': ['Bridal Makeup', 'Editorial Makeup'],
        'price': '500',
        'availability': 'Available',
        'rating': 4.9, // Add rating for AttYourService
        'reviewsCount': 42,
      }
    ];

    return ListView.builder(
      itemCount: artists.length,
      itemBuilder: (context, index) {
        final artist = artists[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArtistProfile(artist: artist),
                ),
              );
            },
            child: Card(
              elevation: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    artist['image'],
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              artist['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            Text(
                              artist['rating'].toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          artist['services'].join(', '),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          artist['location'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          artist['availability'],
                          style: TextStyle(
                            fontSize: 14,
                            color: artist['availability'] == 'Available'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}
