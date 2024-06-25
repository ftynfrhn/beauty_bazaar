// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:beauty_bazaar/components/my_drawer.dart';
import 'package:beauty_bazaar/pages/artist_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedLocation;
  String? selectedService;
  String? selectedAvailability;

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
          SizedBox(height: 16.0),
          Text(
            'Filter Artists by Your Preferences',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: PopupMenuButton<String>(
                      initialValue: selectedLocation,
                      onSelected: (value) {
                        setState(() {
                          selectedLocation = value.isNotEmpty ? value : null;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          _buildLocationItems(),
                      tooltip: 'Filter by Location',
                      child: Text(selectedLocation ?? 'Location'),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: PopupMenuButton<String>(
                      initialValue: selectedService,
                      onSelected: (value) {
                        setState(() {
                          selectedService = value.isNotEmpty ? value : null;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          _buildServiceItems(),
                      tooltip: 'Filter by Services',
                      child: Text(selectedService ?? 'Services'),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: PopupMenuButton<String>(
                      initialValue: selectedAvailability,
                      onSelected: (value) {
                        setState(() {
                          selectedAvailability =
                              value.isNotEmpty ? value : null;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          _buildAvailabilityItems(),
                      tooltip: 'Filter by Availability',
                      child: Text(selectedAvailability ?? 'Availability'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Expanded(
            child: ArtistsList(
              selectedLocation: selectedLocation,
              selectedService: selectedService,
              selectedAvailability: selectedAvailability,
            ),
          ),
        ],
      ),
    );
  }

  List<PopupMenuEntry<String>> _buildLocationItems() {
    return [
      const PopupMenuItem<String>(
        value: '',
        child: Text('All Locations'),
      ),
      const PopupMenuItem<String>(
        value: 'Johor',
        child: Text('Johor'),
      ),
      const PopupMenuItem<String>(
        value: 'Kedah',
        child: Text('Kedah'),
      ),
      const PopupMenuItem<String>(
        value: 'Kelantan',
        child: Text('Kelantan'),
      ),
      const PopupMenuItem<String>(
        value: 'Kuala Lumpur',
        child: Text('Kuala Lumpur'),
      ),
      const PopupMenuItem<String>(
        value: 'Labuan',
        child: Text('Labuan'),
      ),
      const PopupMenuItem<String>(
        value: 'Melaka',
        child: Text('Melaka'),
      ),
      const PopupMenuItem<String>(
        value: 'Negeri Sembilan',
        child: Text('Negeri Sembilan'),
      ),
      const PopupMenuItem<String>(
        value: 'Pahang',
        child: Text('Pahang'),
      ),
      const PopupMenuItem<String>(
        value: 'Perak',
        child: Text('Perak'),
      ),
      const PopupMenuItem<String>(
        value: 'Perlis',
        child: Text('Perlis'),
      ),
      const PopupMenuItem<String>(
        value: 'Penang',
        child: Text('Penang'),
      ),
      const PopupMenuItem<String>(
        value: 'Sabah',
        child: Text('Sabah'),
      ),
      const PopupMenuItem<String>(
        value: 'Sarawak',
        child: Text('Sarawak'),
      ),
      const PopupMenuItem<String>(
        value: 'Selangor',
        child: Text('Selangor'),
      ),
      const PopupMenuItem<String>(
        value: 'Terengganu',
        child: Text('Terengganu'),
      ),
    ];
  }

  List<PopupMenuEntry<String>> _buildServiceItems() {
    return [
      const PopupMenuItem<String>(
        value: '',
        child: Text('All Services'),
      ),
      const PopupMenuItem<String>(
        value: 'Professional Photoshoot Makeup',
        child: Text('Professional Photoshoot Makeup'),
      ),
      const PopupMenuItem<String>(
        value: 'Graduation Makeup',
        child: Text('Graduation Makeup'),
      ),
      const PopupMenuItem<String>(
        value: 'Wedding Makeup',
        child: Text('Wedding Makeup'),
      ),
      const PopupMenuItem<String>(
        value: 'Glamour Event Makeup',
        child: Text('Glamour Event Makeup'),
      ),
      const PopupMenuItem<String>(
        value: 'Special Effects Makeup',
        child: Text('Special Effects Makeup'),
      ),
      const PopupMenuItem<String>(
        value: 'Theatrical Makeup',
        child: Text('Theatrical Makeup'),
      ),
      const PopupMenuItem<String>(
        value: 'Bridal Makeup',
        child: Text('Bridal Makeup'),
      ),
      const PopupMenuItem<String>(
        value: 'Editorial Makeup',
        child: Text('Editorial Makeup'),
      ),
    ];
  }

  List<PopupMenuEntry<String>> _buildAvailabilityItems() {
    return [
      const PopupMenuItem<String>(
        value: '',
        child: Text('All Availability'),
      ),
      const PopupMenuItem<String>(
        value: 'Available',
        child: Text('Available'),
      ),
      const PopupMenuItem<String>(
        value: 'Booked until July 2024',
        child: Text('Booked until July 2024'),
      ),
    ];
  }
}

class FilterListPage extends StatelessWidget {
  final String? selectedLocation;
  final String? selectedService;
  final String? selectedAvailability;

  const FilterListPage({
    Key? key,
    this.selectedLocation,
    this.selectedService,
    this.selectedAvailability,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildFilterItem('Location', selectedLocation),
                _buildFilterItem('Services', selectedService),
                _buildFilterItem('Availability', selectedAvailability),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Map<String, String?> filters = {
                  'location': selectedLocation,
                  'service': selectedService,
                  'availability': selectedAvailability,
                };
                Navigator.pop(context, filters);
              },
              child: const Text('Apply Filters'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterItem(String title, String? selectedValue) {
    List<String> options = [];
    if (title == 'Location') {
      options = [
        '',
        'Johor',
        'Kedah',
        'Kelantan',
        'Kuala Lumpur',
        'Labuan',
        'Melaka',
        'Negeri Sembilan',
        'Pahang',
        'Perak',
        'Perlis',
        'Penang',
        'Sabah',
        'Sarawak',
        'Selangor',
        'Terengganu',
      ];
    } else if (title == 'Services') {
      options = [
        '',
        'Professional Photoshoot Makeup',
        'Graduation Makeup',
        'Wedding Makeup',
        'Glamour Event Makeup',
        'Special Effects Makeup',
        'Theatrical Makeup',
        'Bridal Makeup',
        'Editorial Makeup',
      ];
    } else if (title == 'Availability') {
      options = ['', 'Available', 'Booked until July 2024'];
    }

    return ListTile(
      title: Text(title),
      subtitle: DropdownButton<String>(
        value: selectedValue,
        onChanged: (value) {
          selectedValue = value!.isNotEmpty ? value : null;
        },
        items: options
            .map((option) => DropdownMenuItem<String>(
                  value: option,
                  child: Text(option.isNotEmpty ? option : 'All $title'),
                ))
            .toList(),
      ),
    );
  }
}


class ArtistsList extends StatelessWidget {
  final String? selectedLocation;
  final String? selectedService;
  final String? selectedAvailability;
  final int maxArtistsToShow; // New property to specify the maximum number of artists to display

  const ArtistsList({
    Key? key,
    this.selectedLocation,
    this.selectedService,
    this.selectedAvailability,
    this.maxArtistsToShow = 10, // Default to show 10 artists
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> artists = [
      {
        'image': 'lib/images/sofea.jpeg',
        'name': 'Sofea Jane',
        'location': 'Selangor',
        'services': ['Professional Photoshoot Makeup'],
        'price': '250',
        'availability': 'Available',
        'rating': 4.5,
        'reviewsCount': 20,
      },
      {
        'image': 'lib/images/arissa.jpeg',
        'name': 'Arissa Zahra',
        'location': 'Selangor',
        'services': ['Graduation Makeup'],
        'price': '150',
        'availability': 'Booked until July 2024',
        'rating': 4.0,
        'reviewsCount': 11,
      },
      {
        'image': 'lib/images/joy.webp',
        'name': 'Joy Reece',
        'location': 'Selangor',
        'services': ['Wedding Makeup'],
        'price': '450',
        'availability': 'Booked until July 2024',
        'rating': 3.8,
        'reviewsCount': 27,
      },
      {
        'image': 'lib/images/diana.jpeg',
        'name': 'Diana Akma',
        'location': 'Kuala Lumpur',
        'services': ['Glamour Event Makeup'],
        'price': '200',
        'availability': 'Booked until July 2024',
        'rating': 4.2,
        'reviewsCount': 14,
      },
      {
        'image': 'lib/images/ridz.jpeg',
        'name': 'RidzuanRadzi',
        'location': 'Perak',
        'services': ['Special Effects Makeup', 'Theatrical Makeup'],
        'price': '400',
        'availability': 'Available',
        'rating': 4.7,
        'reviewsCount': 38,
      },
      {
        'image': 'lib/images/att.png',
        'name': 'AttYourService',
        'location': 'Kuala Lumpur',
        'services': ['Bridal Makeup', 'Editorial Makeup'],
        'price': '500',
        'availability': 'Available',
        'rating': 4.9,
        'reviewsCount': 42,
      },
      {
        'image': 'lib/images/jane.jpg',
        'name': 'Afiqa Sulaiman',
        'location': 'Selangor',
        'services': ['Professional Photoshoot Makeup', 'Wedding Makeup'],
        'price': '300',
        'availability': 'Available',
        'rating': 4.3,
        'reviewsCount': 15,
      },
      {
        'image': 'lib/images/suraji.jpg',
        'name': 'Jane Suraji',
        'location': 'Penang',
        'services': ['Graduation Makeup', 'Special Effects Makeup'],
        'price': '180',
        'availability': 'Booked until July 2024',
        'rating': 3.9,
        'reviewsCount': 10,
      },
      {
        'image': 'lib/images/yacup.jpg',
        'name': 'Megat Ammar Yaacup',
        'location': 'Johor',
        'services': ['Glamour Event Makeup', 'Theatrical Makeup'],
        'price': '250',
        'availability': 'Available',
        'rating': 4.5,
        'reviewsCount': 20,
      },
      {
        'image': 'lib/images/dol.jpg',
        'name': 'Doll With Kang',
        'location': 'Kuala Lumpur',
        'services': ['Professional Photoshoot Makeup', 'Wedding Makeup'],
        'price': '400',
        'availability': 'Booked until July 2024',
        'rating': 4.1,
        'reviewsCount': 18,
      },
      {
        'image': 'lib/images/bl.jpg',
        'name': 'Agustina Blanco',
        'location': 'Selangor',
        'services': ['Bridal Makeup', 'Editorial Makeup'],
        'price': '550',
        'availability': 'Available',
        'rating': 4.8,
        'reviewsCount': 30,
      },
      {
        'image': 'lib/images/nh.jpg',
        'name': 'Nabila Hassanah',
        'location': 'Perak',
        'services': ['Graduation Makeup', 'Special Effects Makeup'],
        'price': '200',
        'availability': 'Available',
        'rating': 4.0,
        'reviewsCount': 12,
      },
      {
        'image': 'lib/images/zi.jpg',
        'name': 'Zahra Iylia',
        'location': 'Kedah',
        'services': ['Professional Photoshoot Makeup'],
        'price': '320',
        'availability': 'Available',
        'rating': 4.6,
        'reviewsCount': 22,
      },
      {
        'image': 'lib/images/su.jpg',
        'name': 'Shakila Usada',
        'location': 'Sabah',
        'services': ['Wedding Makeup'],
        'price': '450',
        'availability': 'Booked until July 2024',
        'rating': 3.7,
        'reviewsCount': 25,
      },
      {
        'image': 'lib/images/jp.jpg',
        'name': 'Jessica Puspasari',
        'location': 'Perlis',
        'services': ['Bridal Makeup', 'Editorial Makeup'],
        'price': '500',
        'availability': 'Booked until July 2024',
        'rating': 4.2,
        'reviewsCount': 17,
      },
      {
        'image': 'lib/images/sf.jpg',
        'name': 'S. Fernandes ',
        'location': 'Selangor',
        'services': ['Professional Photoshoot Makeup'],
        'price': '280',
        'availability': 'Available',
        'rating': 4.4,
        'reviewsCount': 19,
      },
      {
        'image': 'lib/images/rr.jpg',
        'name': 'Rao a/p Renuga',
        'location': 'Melaka',
        'services': ['Graduation Makeup'],
        'price': '150',
        'availability': 'Available',
        'rating': 4.1,
        'reviewsCount': 16,
      },
      {
        'image': 'lib/images/rs.jpg',
        'name': 'Raja Samsudin',
        'location': 'Pahang',
        'services': ['Theatrical Makeup'],
        'price': '300',
        'availability': 'Available',
        'rating': 4.7,
        'reviewsCount': 24,
      },
      {
        'image': 'lib/images/jt.jpg',
        'name': 'Jacqueline Tew',
        'location': 'Sarawak',
        'services': ['Special Effects Makeup'],
        'price': '400',
        'availability': 'Available',
        'rating': 4.9,
        'reviewsCount': 28,
      },
      {
        'image': 'lib/images/amp.jpg',
        'name': 'Ah Moy Poh',
        'location': 'Negeri Sembilan',
        'services': ['Bridal Makeup', 'Editorial Makeup'],
        'price': '520',
        'availability': 'Available',
        'rating': 4.6,
        'reviewsCount': 31,
      },
      {
        'image': 'lib/images/yj.jpg',
        'name': 'Yeong binti Johari',
        'location': 'Terengganu',
        'services': ['Glamour Event Makeup', 'Wedding Makeup'],
        'price': '350',
        'availability': 'Booked until July 2024',
        'rating': 3.8,
        'reviewsCount': 21,
      },
      {
        'image': 'lib/images/ol.jpg',
        'name': 'Othman Law',
        'location': 'Labuan',
        'services': ['Professional Photoshoot Makeup', 'Theatrical Makeup'],
        'price': '380',
        'availability': 'Available',
        'rating': 4.5,
        'reviewsCount': 23,
      },
      {
        'image': 'lib/images/mn.jpg',
        'name': 'May Nair',
        'location': 'Kuala Lumpur',
        'services': ['Graduation Makeup'],
        'price': '200',
        'availability': 'Available',
        'rating': 4.2,
        'reviewsCount': 14,
      },
      {
        'image': 'lib/images/pk.jpg',
        'name': 'Patrick Krishnan',
        'location': 'Johor',
        'services': ['Bridal Makeup', 'Editorial Makeup'],
        'price': '480',
        'availability': 'Booked until July 2024',
        'rating': 4.9,
        'reviewsCount': 35,
      },
      {
        'image': 'lib/images/am.jpg',
        'name': 'Anis Mohamed',
        'location': 'Selangor',
        'services': ['Special Effects Makeup'],
        'price': '420',
        'availability': 'Available',
        'rating': 4.3,
        'reviewsCount': 26,
      },
      {
        'image': 'lib/images/nmm.jpg',
        'name': 'Norliana Mazlan',
        'location': 'Penang',
        'services': ['Professional Photoshoot Makeup', 'Glamour Event Makeup'],
        'price': '380',
        'availability': 'Available',
        'rating': 4.7,
        'reviewsCount': 29,
      },

    ];

    // Filter artists based on selected filters
    List<Map<String, dynamic>> filteredArtists = artists.where((artist) {
      bool matchesLocation =
          selectedLocation == null || selectedLocation == '' || artist['location'] == selectedLocation;
      bool matchesService =
          selectedService == null || selectedService == '' || artist['services'].contains(selectedService);
      bool matchesAvailability =
          selectedAvailability == null || selectedAvailability == '' || artist['availability'] == selectedAvailability;

      return matchesLocation && matchesService && matchesAvailability;
    }).toList();

    // Limit the number of artists to display
    filteredArtists = filteredArtists.take(maxArtistsToShow).toList();

    return ListView.builder(
      itemCount: filteredArtists.length,
      itemBuilder: (context, index) {
        final artist = filteredArtists[index];
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
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            Text(
                              artist['rating'].toString(),
                              style: const TextStyle(
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
