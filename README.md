# 🛍️ Shoppe - E-Commerce Flutter App

![IMG-20251009-WA0025](https://github.com/user-attachments/assets/97d7bf79-a10b-44b0-96ba-169b7ca22eee)

![IMG-20251009-WA0024](https://github.com/user-attachments/assets/0a68e379-ccb3-4ecb-b129-f07850981242)

![IMG-20251009-WA0023](https://github.com/user-attachments/assets/a8bc4e0c-8692-4982-a559-64ebbbe990c6)

![IMG-20251009-WA0022](https://github.com/user-attachments/assets/f9f7c6a9-32c1-469b-a2d3-37ed26784f2f)

![IMG-20251011-WA0008](https://github.com/user-attachments/assets/61e8c248-8244-42c3-ae31-7966316b0eb6)

![IMG-20251011-WA0009](https://github.com/user-attachments/assets/609c2a76-9e90-4511-8de0-c2626beb3d4a)

![IMG-20251011-WA0005](https://github.com/user-attachments/assets/cd51a8c3-4dba-468f-bc75-348487632d9a)

![IMG-20251011-WA0003](https://github.com/user-attachments/assets/93fd28a4-a94f-4c38-b3f0-d5a764c2c445)

![IMG-20251011-WA0004](https://github.com/user-attachments/assets/17a391f7-34ec-4f69-9f95-c82177955077)

![IMG-20251011-WA0007](https://github.com/user-attachments/assets/b2bd89bf-1734-4ae3-9494-c298d664517b)

A modern, beautiful e-commerce mobile application built with Flutter, featuring a clean architecture and comprehensive shopping experience.

## 📱 Features

### 🔐 Authentication
- **User Registration** - Create new accounts with email verification
- **Login System** - Secure user authentication
- **Email Verification** - OTP-based email verification process

### 🏠 Home & Shopping
- **Product Browsing** - Browse products with beautiful grid layout
- **Brand Selection** - Support for major brands (Adidas, Nike, Fila, Puma)
- **Search Functionality** - Search products with voice support
- **Product Details** - Detailed product view with images and specifications
- **Reviews System** - Product reviews and ratings

### ❤️ User Experience
- **Wishlist** - Save favorite products for later
- **Shopping Cart** - Add items to cart for purchase
- **Payment Integration** - Secure payment processing
- **Responsive Design** - Optimized for all screen sizes

### 🎨 UI/UX Features
- **Modern Design** - Clean and intuitive interface
- **Shimmer Loading** - Smooth loading animations
- **Custom Animations** - Smooth page transitions
- **Dark/Light Theme Support** - Beautiful color schemes

## 🏗️ Architecture

This project follows **Clean Architecture** principles with:

- **Presentation Layer** - UI components, widgets, and state management
- **Domain Layer** - Business logic and entities
- **Data Layer** - API services, repositories, and data models
- **Dependency Injection** - Using GetIt for service locator pattern

### 📁 Project Structure

```
lib/
├── core/
│   ├── api/              # API services and networking
│   ├── constant/         # App constants
│   ├── DI/              # Dependency injection setup
│   ├── domain/          # Domain layer entities
│   ├── error/           # Error handling
│   ├── helper/          # Utility helpers
│   ├── presentation/    # Shared presentation components
│   ├── router/          # App navigation and routing
│   └── utils/           # Utility functions and styles
├── feature/
│   ├── auth/            # Authentication features
│   │   ├── login/       # Login functionality
│   │   └── register/    # Registration functionality
│   ├── home/            # Home and product features
│   ├── nav_bar/         # Bottom navigation
│   └── splash_screen/   # App splash screen
└── main.dart           # App entry point
```

## 🛠️ Tech Stack

- **Framework**: Flutter 3.9.2+
- **State Management**: Flutter Bloc (Cubit)
- **Dependency Injection**: GetIt
- **Networking**: Dio with Retrofit
- **Local Storage**: SharedPreferences, Flutter Secure Storage
- **Image Caching**: Cached Network Image
- **UI Components**: Custom widgets with Material Design
- **Animations**: Shimmer effects and smooth transitions

## 📦 Dependencies

### Core Dependencies
- `flutter_bloc: ^9.1.1` - State management
- `get_it: ^8.2.0` - Dependency injection
- `dio: ^5.9.0` - HTTP client
- `retrofit: ^4.7.3` - API client generator
- `json_annotation: ^4.9.0` - JSON serialization

### UI Dependencies
- `flutter_svg: ^2.2.1` - SVG support
- `cached_network_image: ^3.4.1` - Image caching
- `shimmer_animation: ^2.2.2` - Loading animations
- `dotted_border: ^3.1.0` - Custom borders
- `pin_code_fields: ^8.0.1` - OTP input fields

### Storage Dependencies
- `shared_preferences: ^2.5.3` - Local storage
- `flutter_secure_storage: ^9.2.4` - Secure storage

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.9.2 or higher
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/e_commerce_app.git
   cd e_commerce_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🔧 Configuration

### API Configuration
Update the API base URL in `lib/core/api/api_service.dart`:
