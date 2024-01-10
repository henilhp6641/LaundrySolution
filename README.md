# Laundry App

## Overview

Welcome to the Laundry App – a mobile solution that brings laundry services to your doorstep. This innovative platform comprises two applications: one designed for users and another tailored for drivers, simplifying the process of clothes washing and delivery.

### For Users

- **Select and Send**: Choose your clothes for washing within the app. Just select, and we'll handle the rest.
- **Pickup at Your Convenience**: Set your pickup location and our drivers will come to you.
- **Easy Payment Options**: Make payments seamlessly through the app.
- **Customizable Plans**: Choose from a variety of monthly washing plans to best suit your needs.
- **Track Your Orders**: Keep an eye on your laundry's journey with our order history feature.
- **User Profiles**: Manage your personal details and preferences in a dedicated profile section.
- **Laundry Store Locator**: Find the nearest laundry store with ease.

### For Drivers

- **Stay Notified**: Get instant notifications about new orders.
- **Navigate with Ease**: Use our app to find the best route to the user's location, thanks to integrated map navigation.
- **Order Management**: Keep track of pickups and deliveries at your fingertips.

## Technical Specifications

- **Authentication**: Secure user and driver authentication via Google Firebase.
- **Database**: Robust Google Firestore databases to store all pertinent data including order details, user and driver profiles, and monthly plans.
- **Real-Time Alerts**: Firebase push notifications to keep drivers informed of new orders.
- **Location Services**: Integration of Google Maps API for accurate and efficient location tracking.

## Firebase Setup

To integrate Firebase into your Laundry App for both the user and driver interfaces, follow these steps:

1. **Create a Firebase Project**:
   - Go to the [Firebase Console](https://console.firebase.google.com/).
   - Click on 'Add project' and follow the steps to create a new Firebase project.

2. **Configure Firebase in Your Apps**:
   - Once your Firebase project is set up, add a new app for both the User and Driver applications.
   - In the Firebase project settings, you will find your app's Firebase configuration object. It looks something like this:
     ```javascript
     var firebaseConfig = {
       apiKey: "API_KEY",
       authDomain: "PROJECT_ID.firebaseapp.com",
       projectId: "PROJECT_ID",
       storageBucket: "PROJECT_ID.appspot.com",
       messagingSenderId: "SENDER_ID",
       appId: "APP_ID",
       measurementId: "G-MEASUREMENT_ID"
     };
     ```
   - Copy this configuration object.
   - In your project's source code, locate the Firebase initialization file (often in a `firebase.js` or similar file) and replace the existing Firebase configuration object with the one from your Firebase project settings.

3. **Enable Required Firebase Services**:
   - In the Firebase Console, navigate to the 'Authentication' section and enable the authentication methods you intend to use.
   - Set up Firestore Database in the 'Firestore Database' section to store user, driver, and order information.
   - If you're using Firebase Storage, set it up in the 'Storage' section.

## Usage

- **User App: After installation, register and log in to start using the laundry services. Select your clothes, schedule a pickup, and choose a washing plan.
- **Driver App: Log in to receive and manage laundry orders. Use the app for navigation and order tracking.
