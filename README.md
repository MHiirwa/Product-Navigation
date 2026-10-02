**Product Navigation App**
**Overview**

This project is a Flutter application that demonstrates product listing, reusable UI components, and navigation between screens.

The application presents a list of products containing their name, description, price, color, and rating. Selecting a product opens a dedicated details screen displaying the corresponding information.

**Features**

-Product listing using ListView.builder
-Reusable product card component
-Product details screen
-Navigation using Flutter's Navigator
-Dynamic product information
-Reusable rating component
-Material Design interface

**Technologies**

Flutter
-Dart
-Material Design

**Project Structure**
lib/
└── main.dart
    ├── Product
    ├── ProductListPage
    ├── ProductCard
    ├── RatingStars

    └── ProductDetailsPage

**Navigation**
The application uses Navigator.push() to open the product details screen and Navigator.pop() to return to the product list.

**Running the Project**
-flutter pub get
-flutter run

**Demonstration**
YouTube demonstration:
https://www.youtube.com/watch?v=QZUQZIMGhuc

**Objective**
The project demonstrates fundamental Flutter concepts, including widget composition, data modeling, list rendering, reusable components, and screen navigation.
