import 'package:flutter/material.dart';
import 'package:beauty_bazaar/components/my_drawer.dart';
import 'package:beauty_bazaar/pages/artist_profile.dart'; 


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BeautyBazaar'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: const Column(
        children: <Widget>[
          SearchBar(),
          SizedBox(height: 12.0),
          FilterOptions(),
          Expanded(
            child: NearbyArtistsList(),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Search for makeup artists',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}

class FilterOptions extends StatelessWidget {
  const FilterOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilterChip(
            label: const Text('Location'),
            onSelected: (isSelected) {
              // Implement filtering by location
            },
          ),
          FilterChip(
            label: const Text('Services'),
            onSelected: (isSelected) {
              // Implement filtering by services
            },
          ),
          FilterChip(
            label: const Text('Availability'),
            onSelected: (isSelected) {
              // Implement filtering by availability
            },
          ),
        ],
      ),
    );
  }
}

class NearbyArtistsList extends StatelessWidget {
  const NearbyArtistsList({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for makeup artists
    final List<Map<String, dynamic>> artists = [
      {
        'name': 'Sofea Jane',
        'location': 'Shah Alam, Selangor',
        'services': ['Professional Photoshoot Makeup'],
        'availability': 'Available',
      },
      {
        'name': 'Arissa Zahra',
        'location': 'Shah Alam, Selangor',
        'services': ['Graduation Makeup'],
        'availability': 'Booked until July 2024',
      },
      {
        'name': 'Joy Reece',
        'location': 'Kajang, Selangor',
        'services': ['Wedding Makeup'],
        'availability': 'Booked until July 2024',
      },
      {
        'name': 'Diana Akma',
        'location': 'Kuala Lumpyr',
        'services': ['Glamour Event Makeup'],
        'availability': 'Booked until July 2024',
      },
      {
        'name': 'RidzuanRadzi',
        'location': 'Taiping, Perak',
        'services': ['Special Effects Makeup', 'Theatrical Makeup'],
        'availability': 'Available',
      },
      {
        'name': 'AttYourService',
        'location': 'Kuala Lumpur',
        'services': ['Bridal Makeup', 'Editorial Makeup'],
        'availability': 'Available',
      },
      {
        'name': 'MakeUp by Kip',
        'location': 'Negeri Sembilan',
        'services': ['Event Makeup', 'Fashion Makeup'],
        'availability': 'Booked until August 2024',
      },
      {
        'name': 'Faradieba Rahamad',
        'location': 'Kuala Lumpur',
        'services': ['Bridal Makeup', 'Special Effects Makeup'],
        'availability': 'Available',
      },
      {
        'name': 'Xia Erni',
        'location': 'Penang',
        'services': ['Fashion Makeup', 'Theatrical Makeup'],
        'availability': 'Booked until September 2024',
      },
      {
        'name': 'ImanSamsul',
        'location': 'Penang',
        'services': ['Event Makeup', 'Editorial Makeup'],
        'availability': 'Available',
      },
      {
        'name': 'Athi Perera',
        'location': 'Kedah',
        'services': ['Bridal Makeup', 'Graduation Makeup'],
        'availability': 'Booked until October 2024',
      },
    ];

    return ListView.builder(
      itemCount: artists.length,
      itemBuilder: (context, index) {
        final artist = artists[index];
        return ListTile(
          title: Text(artist['name']),
          subtitle: Text('${artist['location']} - ${artist['availability']}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArtistProfile(artist: artist),
              ),
            );
          },
        );
      },
    );
  }
}