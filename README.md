
# MegaViz Chat

A modern chat application built with Flutter and Firebase, designed for real-time communication with 1:1 messaging, image sharing, presence tracking, and push notifications. Developed using Clean Architecture and Riverpod for scalable and maintainable code organization.

## 🎥 Demo

**[APK Download]** *https://loadly.io/u1DbAM3m*

## 📱 Features

### 🔐 Authentication
- **Firebase Authentication**
  - Google Sign-In
  - Facebook Sign-In

- **User Data Storage**
  - UID, Name, Email, Profile Photo
  - FCM Token
  - Online status (isOnline)
  - Last seen timestamp

### 💬 Chat Functionality
- **One-on-One Messaging**
  - Send and receive text messages
  - Upload and send image messages
  - Real-time message updates via Firestore
  - Display message order (latest last)

- **Message Status**
  - ✅ Single tick for sent
  - ✅ Double tick for delivered

- **User List**
  - All users fetched from Firestore
  - Show online/offline status in real-time

### 🖼️ Media Messaging
- Upload images to Firebase Storage
- Show uploaded images in chat bubbles
- Lazy loading and caching of images

### 🧑‍💼 Presence Tracking
- Realtime presence updates via Firestore
- `isOnline: true/false` and last seen
- Automatically update on logout/disconnect

### 📲 Push Notifications
- Firebase Cloud Messaging (FCM)
  - Foreground, background, and terminated state
  - Notifications triggered on new messages

### 🚪 Logout
- Sets user `isOnline = false`
- Clears local session
- Navigates to login screen

## 🚀 Tech Stack & Rationale

### Frontend
**Flutter** - Cross-platform mobile development framework  
- Riverpod for state management  
- Clean Architecture for maintainability  
- Hooks for efficient widget lifecycle

### Backend
**Firebase Services**
- **Firebase Authentication**: User sign-in
- **Firestore**: Real-time database
- **Firebase Storage**: Media/image storage
- **Firebase Cloud Messaging**: Push notifications

## 🛠️ Setup Instructions

### Prerequisites
- Flutter SDK (3.x or higher)
- Firebase Project setup with Authentication, Firestore, Storage, and FCM
- Android Studio / Xcode
- Facebook Developer App (for Facebook Sign-In)
- Google Sign-In configuration


## 🏗️ Architecture

### Clean Architecture
This application follows **Clean Architecture** principles with clear separation of concerns across different layers. Each feature is organized into distinct layers to ensure maintainability, testability, and scalability.

#### Feature-Based Clean Architecture Structure
Each feature in the `lib/src/features/` directory follows this layered structure:

```
feature_name/
├── application/         # Application Layer
│   └── providers/       # Riverpod providers for data and domain logic
├── data/               # Data Layer
│   ├── models/         # Data models and DTOs
│   ├── repositories/   # Repository implementations
│   └── sources/        # Data sources (API, local storage)
├── domain/             # Domain Layer
│   ├── entities/       # Business entities
│   ├── repositories/   # Repository interfaces
│   └── use_cases/      # Business logic and use cases
└── presentation/       # Presentation Layer
    ├── providers/      # UI state providers
    └── views/          # UI components and screens
```

#### Layer Responsibilities:

- **Domain Layer**: Contains business entities, repository contracts, and use cases. This layer is framework-independent and contains the core business logic.

- **Data Layer**: Handles data persistence and retrieval. Implements repository contracts defined in the domain layer and manages data sources (APIs, databases, cache).

- **Application Layer**: Acts as a bridge between domain and presentation layers. Contains Riverpod providers that orchestrate use cases and manage application state.

- **Presentation Layer**: Contains UI components, screens, and presentation logic. Depends only on the application layer for state management.

### State Management
- **Riverpod**: Robust state management solution
- **Hooks**: For efficient widget lifecycle management
- **Freezed**: Immutable data classes with code generation

## 📱 App Structure

```
lib/
├── main.dart                 # App entry point
└── src/
    ├── app.dart             # Main app configuration
    ├── features/            # Feature-based architecture
    │   ├── auth/           # Authentication features
    │   ├── chat/          # Realtime chat
    │   ├── notifications/        # Notification features
    ├── shared/             # Shared widgets and utilities
    └── core/               # Core app functionality
```
