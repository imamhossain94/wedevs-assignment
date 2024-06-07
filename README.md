# Dokan WeDevs Assignment

## Overview

Dokan is a Flutter-based mobile application that interacts with a WordPress backend using REST APIs. The app implements the repository pattern, GetX for state management and dependency injection, and supports multiple build flavors. It includes features like user authentication (sign-up and login), profile management, and product display from local JSON data.

## Features

- User Authentication (Sign-up, Login)
- Profile Management
- Product Display
- Bottom Navigation with Multiple Tabs (Home, Menu, Search, Cart, Profile)
- Repository Pattern Implementation
- GetX for State Management and Dependency Injection
- Build Flavors (Development, Production)

## Project Structure

```plaintext
lib/
├── core/
│   ├── bindings/
│   │   ├── initial_binding.dart
│   │   └── base_binding.dart
│   ├── controllers/
│   ├── models/
│   ├── repositories/
│   │   ├── api_service.dart
│   │   └── local_data_repository.dart
│   ├── services/
│   └── utils/
├── data/
│   ├── models/
│   │   └── product.dart
├── modules/
│   ├── home/
│   │   ├── controllers/
│   │   │   └── home_controller.dart
│   │   ├── views/
│   │   │   └── home_view.dart
│   │   └── bindings/
│   │       └── home_binding.dart
│   ├── auth/
│   │   ├── controllers/
│   │   │   └── auth_controller.dart
│   │   └── views/
│   │       └── auth_view.dart
│   ├── cart/
│   │   ├── controllers/
│   │   └── views/
│   ├── category/
│   │   ├── controllers/
│   │   └── views/
│   ├── explore/
│   │   ├── controllers/
│   │   └── views/
│   ├── profile/
│   │   ├── controllers/
│   │   └── views/
├── main.dart
└── README.md


## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- A running WordPress instance with the required plugins (JWT Authentication for WP REST API)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/dokan-flutter-app.git
   cd dokan-flutter-app





