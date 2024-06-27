# BeautyBazaar - A Revolutionary Makeup Artist Booking Platform

- Group Name: Eclair
- Group Member Details:
  1. NUR FATIN FARHANA BINTI HAMDAN (2014226)
  2. BALQIS HAIFA BINTI M.NASER (2026210)

### Task Distribution
1. Fatin Farhana
   - Login and Register related pages (include auth folder)
   - User Profile page
   - Booking page
   - Payment page
   - Booking Confirmation page
   - others: components, theme, helper, main.dart
2. Balqis Haifa
   - Homepage
   - Booking History page
   - Artist Profile page
   - Forgot Password function

## Descriptions of the project
### Introduction
In the modern beauty industry, finding skilled makeup artists can be challenging for both clients and professionals. BeautyBazaar is an innovative mobile application designed to connect makeup artists with clients effortlessly. Inspired by the user-friendly interface of Airbnb, BeautyBazaar aims to streamline the process of booking makeup services, enhance accessibility, and build trust within the beauty community.

### Objective
The primary objective of BeautyBazaar is to provide a centralized platform where clients can easily find and book certified makeup artists. The app aims to simplify the booking process, and offer a user-friendly experience, making it easier for clients to access professional makeup services.

### Features and functionalities:
  1. User Profiles: Separate profiles for makeup artists and clients.
  2. Filter: Filter makeup artists based on location, availability, and types of services.
  3. Booking System: Schedule appointments with makeup artists, and confirm bookings.
  4. Payment Gateway: Secure payment options within the app.
  5. Booking History: Access user booking history.

### Packages:
  1. flutter/material.dart - Provides material design widgets and utilities for building Flutter UIs.
  2. flutter_credit_card - Offers widgets and utilities for handling credit card forms and views.

### Plugins:
  1. firebase_core - Initializes and configures Firebase in a Flutter app.
  2. firebase_auth - Provides Firebase authentication services.
  3. cloud_firestore - Integrates Cloud Firestore for real-time database access.Integrates Cloud Firestore for real-time database access.

## Project Structure
### UI and Reusable Widgets
  1. Login Screen: Allows login with Firebase authentication, includes forgot password functionality, and provides features to navigate to the register page.
  2. Register Screen: Allows user registration, implements Firebase authentication, and provides features to navigate to the login page.
  3. Home Screen: Features filter options and a list of nearby makeup artists, with a drawer containing links to the homepage, profile, and logout.
  4. User Profile Screen: Displays user information with editing capabilities using Firebase for fetching and updating data, and provides access to booking history.
  5. Booking History Screen: Displays a list of bookings made by each user, fetched from Cloud Firestore.
  6. Artist Profile Screen: Display artist details and include a booking button.
  7. Booking Screen: Includes calendar and clock views for selecting date and time, and fields for entering location and contact number information.
  8. Payment Screen: Includes a payment processing widget using a credit card package and creates a new collection in Cloud Firestore for each confirmed payment process.
  9. Booking Confirmation Screen: Displays details confirming payment and includes a button to navigate directly to the homepage.

  ![Navigation Diagram Eclair](https://github.com/ftynfrhn/beauty_bazaar/assets/123931608/98d9b901-69ef-464e-9c69-de58c2bfb537)

### Sequence Diagram
  ![sequence diagram mobile](https://github.com/ftynfrhn/beauty_bazaar/assets/123931608/20b68808-9208-40e0-8bd1-fec0124e83e5)

## Weekly Progress Report
![Weekly Progress Report Eclair_Page_1](https://github.com/ftynfrhn/beauty_bazaar/assets/123931608/52ffac83-4c22-448e-b458-f2272e5e836f)
![Weekly Progress Report Eclair_Page_2](https://github.com/ftynfrhn/beauty_bazaar/assets/123931608/6a1054d2-8b2a-429d-a694-3edee332e3bf)

## References
1. Ojerinda et al. (2019). Mobile Based Appointment And Scheduling Management System For Makeup Artist.
2. Airbnb User Interface Inspiration.
3. Mitch Koko (2024, Apr 14). Firebase x Flutter Masterclass: Auth / Firestore / Storage / Hosting. Youtube. https://youtu.be/0RWLaJxW7Oc?si=5tPzv7Dir_MIWIj5
4. Mitch Koko (2023, Jun 2). The WALL / Social Media App • Flutter x Firebase / FULL TUTORIAL. Youtube. https://youtu.be/prp8-j3W_V0?si=gcvoCaDKvMCy7fy0
5.  Mitch Koko (2024, Mar 15).  FULL Food Delivery App w/ Backend • Flutter Tutorial. Youtube. https://youtu.be/rHIFJo4IbOE?si=9WDmy36fZijx-usl
6. Shivam Gupta (2024, Apr 9). Master Barber Booking App with Admin Panel | Flutter x Firebase Tutorial 2024. Youtube. https://youtu.be/lGsuOJQXZWA?si=oMJGB2iIHkgUQ3Pg

