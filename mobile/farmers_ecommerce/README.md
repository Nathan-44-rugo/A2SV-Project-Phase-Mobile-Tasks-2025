# Farmer's E-commerce App

This is a simple e-commerce mobile application built with Flutter. The app allows users to manage a list of farm produce products with functionality to **create**, **view**, **edit**, and **delete** items. It demonstrates the use of navigation, named routes, state management, and persistent storage in a Flutter project.

---

## Features

- **Home Screen**: Displays a list of all products added by the user.
- **Add Product Screen**: Allows the user to input details of a new product (name, price, category, description).
- **Edit Product Screen**: Lets the user modify existing product details.
- **Product Detail Screen**: Shows detailed information of a selected product.
- **Navigation Animations**: Smooth transitions between screens using custom slide animations.
- **Data Persistence**: Products are stored locally using custom read/write methods.

---

## Navigation and Routing

This app uses Flutter's built-in navigation system with the following enhancements:

1. **Named Routes**  
   Each screen has a named route registered in the main app file. This ensures clean and manageable navigation throughout the app.

2. **Data Passing Between Screens**  
   Product data is passed between the home screen and add/edit/detail screens to ensure dynamic updates and state retention.

3. **Back Button Handling**  
   Navigating back from the add/edit screen returns the user to the home screen and refreshes the product list.

---

## Project Structure
```plaintext
lib/
├── data/           # readwrite.dart - handles local JSON storage
├── model/          # product.dart - model class for Product
├── screens/
│   ├── home_screen.dart
│   ├── add_screen.dart
│   ├── edit_product_screen.dart
│   └── details_screen.dart
├── main.dart       # App entry point and route definitions
