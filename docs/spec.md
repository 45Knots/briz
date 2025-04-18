# Briz Mobile App - Developer-Ready Specification (Milestone 1)

## 1. Introduction

Briz is a mobile application for iOS and Android that allows users to browse and book sailing boats and cruisers available for daily cruises. This document outlines the requirements, architecture, data handling, error handling, and testing plan for the first phase of development.

## 2. Goals for this Phase

* Implement user authentication (login/signup via social accounts and phone).
* Enable users to browse available boats based on location, date, boat type, and capacity.
* Display search results with key information, sorted by estimated travel distance using Google Maps.
* Provide a detailed view for each boat with images, metadata (make, length, cabins), and price breakdown (daily rate, optional skipper/catering/host costs).
* Implement a "like" functionality for saving favorite boats.
* Enable users to submit booking requests, view total price, and receive confirmation of submission.
* Allow operators to accept or reject booking requests with a predefined reason and optional comments.
* Implement a pre-cruise reminder and optional wake-up alarm with travel time calculation.
* Introduce a "Daily Cruise Mode" with location-based points of interest (via Google Places API) and an embedded Google Photos album for shared media.
* Implement a deposit system with a temporary hold on funds for both customer and operator upon booking acceptance.
* Facilitate full payment via a tap-to-pay mechanism (conceptual for MVP, specific integration details to follow).

## 3. Target Platforms

* iOS (latest stable version and previous)
* Android (latest stable version and previous)

## 4. Technology Stack

* **Cross-platform Development:** Flutter (for UI and core logic)
* **Backend:** Firebase
    * **Firebase Authentication:** For user authentication (social login, phone authentication).
    * **Cloud Firestore:** For storing user data, boat details, booking information, and other structured data.
    * **Cloud Storage:** For storing boat images and other media files.
    * **Cloud Functions:** For backend logic, integration with third-party APIs (Google Places, Google Maps Distance Matrix), and potentially handling deposit logic.
* **Third-Party Integrations:**
    * **Google Places API:** For location autocomplete in search and for fetching points of interest in "Daily Cruise Mode."
    * **Google Maps Distance Matrix API:** For calculating travel distances for sorting search results.
    * **Google Sign-In SDK (FlutterFire):** For Google social login.
    * **Facebook SDK (FlutterFire):** For Facebook social login.
    * **Firebase Auth (FlutterFire):** For phone number login/signup and OTP verification.
    * **Google Maps Flutter Plugin:** For displaying maps and potentially selecting locations.
    * **URL Launcher (Flutter Plugin):** For linking out to Google Maps for directions.
    * **Google Photos API (via backend):** For creating and embedding albums.
    * **Device Calendar Plugin (Flutter):** For setting reminders and alarms.
    * **Location Plugin (Flutter):** For accessing device location.

## 5. Data Model (Cloud Firestore)

* **Users Collection:**
    * `uid` (document ID)
    * `email`
    * `phoneNumber`
    * `displayName`
    * `photoURL`
    * `socialLogins` (map of providers and their IDs)
    * `favoriteBoats` (array of boat IDs)
    * `notificationPreferences` (map: email: bool, sms: bool, whatsapp: bool, viber: bool, telegram: bool)
    * *(Potentially payment information - to be detailed later)*
* **Boats Collection:**
    * `boatId` (document ID)
    * `ownerId` (reference to Users collection)
    * `name`
    * `description`
    * `images` (array of image URLs in Cloud Storage)
    * `location` (GeoPoint - latitude and longitude)
    * `address` (string for display)
    * `type` (enum: 'sailing', 'cruiser')
    * `capacity` (number)
    * `make` (string)
    * `length` (string)
    * `cabins` (number)
    * `dailyRate` (number)
    * `skipperAvailable` (boolean)
    * `skipperPrice` (number, optional)
    * `cateringAvailable` (boolean)
    * `cateringPrice` (number, optional)
    * `hostAvailable` (boolean)
    * `hostPrice` (number, optional)
    * `availability` (map of dates to boolean/status - initial MVP might assume always available)
* **Bookings Collection:**
    * `bookingId` (document ID)
    * `boatId` (reference to Boats collection)
    * `userId` (reference to Users collection)
    * `bookingDate` (Timestamp)
    * `numberOfPeople` (number)
    * `skipperIncluded` (boolean)
    * `cateringIncluded` (boolean)
    * `hostIncluded` (boolean)
    * `totalPrice` (number)
    * `bookingStatus` (enum: 'pending', 'accepted', 'rejected', 'completed', 'cancelled')
    * `rejectionReason` (string, optional)
    * `rejectionComments` (string, optional)
    * `googlePhotosAlbumId` (string, optional)
    * `depositAmount` (number, optional)
    * `depositStatus` (enum: 'pending', 'held', 'released', optional)
* **PointsOfInterest Collection:** *(For MVP, we will rely solely on Google Places API)*

## 6. User Interface (Flutter)

* **Authentication Screens:** Login/Signup with social (Google, Facebook) and phone number.
* **Boat Browsing Screen:**
    * Search bar with location autocomplete (Google Places).
    * Filtering options (date picker, boat type, capacity).
    * List view of boats sorted by travel distance (Google Maps Distance Matrix).
    * Each item displays a carousel of images, daily price, capacity icon, catering icon, skipper icon, and distance.
* **Detailed Boat Screen:**
    * Flexible app bar with main boat image and title (boat name).
    * Horizontal scrollable list of image thumbnails.
    * Boat metadata (make, length, number of cabins).
    * Price breakdown (daily rate, optional add-ons with prices).
    * Collapsible section for operator/skipper/host bio and avatar.
    * "Like" button.
    * "Request Booking" button.
* **Booking Request Confirmation Screen:** Displays booking details and confirmation of submission.
* **User Profile Screen:** Section to view favorite boats.
* **Daily Cruise Mode Screen:**
    * Map view (Google Maps) or list of nearby points of interest fetched from Google Places API.
    * Embedded view of the Google Photos album for the current booking.

## 7. Backend Logic (Firebase Cloud Functions)

* **Calculating Travel Distance:** Function to call Google Maps Distance Matrix API based on user location and boat location.
* **Fetching Points of Interest:** Function to periodically call Google Places API based on user coordinates in "Daily Cruise Mode."
* **Creating Google Photos Album:** Function to interact with the Google Photos API to create a shared album upon booking confirmation (or start of cruise mode).
* **Sending Notifications:** Function to send notifications (in-app, email, SMS, etc.) based on user preferences for booking requests and operator responses. (Consider using Firebase Cloud Messaging for in-app and potentially email via SendGrid or similar for more robust email delivery).
* **Handling Deposit Holds:** *(Conceptual for MVP - logic to trigger and manage will require payment gateway integration later).*

## 8. Error Handling

* **Flutter:** Implement `try-catch` blocks for API calls and data processing. Display user-friendly error messages (e.g., "Network error," "Failed to fetch data"). Implement retry mechanisms where appropriate.
* **Firebase:** Handle errors from Firebase Authentication, Firestore, Storage, and Cloud Functions. Log errors for debugging (Firebase Crashlytics).
* **API Errors:** Implement robust error handling for responses from Google Places and Google Maps APIs. Handle rate limits and unexpected responses gracefully.
* **User Input Validation:** Validate user inputs (e.g., number of people) on the client-side.

## 9. Testing Plan

* **Unit Tests (Flutter):** Test individual widgets, utility functions, and business logic.
* **Widget Tests (Flutter):** Test the UI components and their interactions.
* **Integration Tests (Flutter):** Test the interaction between Flutter app and Firebase services (Authentication, Firestore, Storage, Functions) using emulators. Mock external API calls where necessary.
* **End-to-End Tests (Manual & potentially automated):** Test complete user flows (e.g., signup, browsing, booking request, operator acceptance) on both iOS and Android devices/simulators.
* **API Testing (Cloud Functions):** Use tools like Postman or Firebase Test Functions to test the endpoints and functionality of the Cloud Functions.
* **User Acceptance Testing (UAT):** Testing by stakeholders to ensure the application meets the requirements and is user-friendly.
* **Performance Testing:** Basic testing to ensure the app is responsive and performs adequately.
* **Platform-Specific Testing:** Thorough testing on both iOS and Android to identify and fix platform-specific UI/UX issues.

## 10. Deployment

* **iOS:** Deployment to the Apple App Store.
* **Android:** Deployment to the Google Play Store.
* **Firebase:** Deploy Cloud Functions and configure Firebase project settings.

## 11. Open Questions and Areas for Further Discussion

* The exact percentage for the deposit hold.
* Terms and conditions for booking and cancellations.
* Specific payment gateway integration details for the tap-to-pay functionality and deposit handling.
* Implementation of the operator's interface for managing their boat listings and responding to booking requests.
* The predefined list of reasons for operators to reject booking requests.
* Detailed UI/UX design for various screens and flows.
* Specific error messages and UI for error handling.
* Monetization strategies beyond the initial app.
