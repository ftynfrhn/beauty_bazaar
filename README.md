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
1. User Profiles:
- Makeup Artist Profiles: Showcase portfolios, including location, availability, services offered, prices, reviews, and a booking function.
- Client Profiles: Display user details such as name, username, email, bio, and booking history.
2. Filter: Allow users to filter makeup artists based on location, availability, and types of services offered.
3. Booking System: Enable users to schedule appointments with makeup artists by selecting the desired date, time, and inputting the location and contact number, with a confirmation of bookings.
4. Payment Gateway: Provide secure payment options within the app through credit card payments, with confirmation for transactions.
5. Booking History: Allow users to access their booking history, including details of the makeup artist, date, time, and location of past appointments.

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
![Simulator Screenshot - iPhone 15 Pro Max - 2024-06-27 at 23 54 18](https://github.com/ftynfrhn/beauty_bazaar/assets/133851030/1b26f259-b1b3-46b2-8bf7-9775d9f8f1b1)

  2.Register Screen: Allows user registration, implements Firebase authentication, and provides features to navigate to the login page.
![Simulator Screenshot - iPhone 15 Pro Max - 2024-06-27 at 23 54 26](https://github.com/ftynfrhn/beauty_bazaar/assets/133851030/c9c2d6c5-7c8d-4202-9a4d-4a0f66305074)

  3. Home Screen: Features filter options and a list of nearby makeup artists, with a drawer containing links to the homepage, profile, and logout.
![Simulator Screenshot - iPhone 15 Pro Max - 2024-06-27 at 23 49 40](https://github.com/ftynfrhn/beauty_bazaar/assets/133851030/1314e6b0-1860-4988-b53b-461fe0b75497)

  5. User Profile Screen: Displays user information with editing capabilities using Firebase for fetching and updating data, and provides access to booking history.
![Simulator Screenshot - iPhone 15 Pro Max - 2024-06-27 at 23 50 28](https://github.com/ftynfrhn/beauty_bazaar/assets/133851030/bbc84b2c-9760-4995-96e1-8a8d0df46e75)

  7. Booking History Screen: Displays a list of bookings made by each user, fetched from Cloud Firestore.
 ![Simulator Screenshot - iPhone 15 Pro Max - 2024-06-27 at 23 52 25](https://github.com/ftynfrhn/beauty_bazaar/assets/133851030/3160c653-6ab6-43f6-8c9b-ab908ab5e58f)

  9. Artist Profile Screen: Display artist details and include a booking button.
![Simulator Screenshot - iPhone 15 Pro Max - 2024-06-27 at 23 52 39](https://github.com/ftynfrhn/beauty_bazaar/assets/133851030/b2560906-ae9d-4b63-b252-59f52df1e63c)
 
  10. Booking Screen: Includes calendar and clock views for selecting date and time, and fields for entering location and contact number information.
![Simulator Screenshot - iPhone 15 Pro Max - 2024-06-27 at 23 52 53](https://github.com/ftynfrhn/beauty_bazaar/assets/133851030/6eb73837-b6ed-4442-bfb0-6d1c3cc5eb2b)

  11. Payment Screen: Includes a payment processing widget using a credit card package and creates a new collection in Cloud Firestore for each confirmed payment process.
![Simulator Screenshot - iPhone 15 Pro Max - 2024-06-27 at 23 53 12](https://github.com/ftynfrhn/beauty_bazaar/assets/133851030/dcbf0e95-1efd-4c6c-9764-943bc05a773e)

  12. Booking Confirmation Screen: Displays details confirming payment and includes a button to navigate directly to the homepage.
![Simulator Screenshot - iPhone 15 Pro Max - 2024-06-27 at 23 53 52](https://github.com/ftynfrhn/beauty_bazaar/assets/133851030/224f0cfd-342d-4d82-b365-b9fa998b1708)


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

