# Flutter Firebase Todo App

A Flutter Todo application built with Firebase Authentication and Cloud Firestore using a Feature-Based Architecture and GetX State Management.

## Features

### Authentication

* User Registration (Email & Password)
* User Login
* Firebase Authentication
* User Logout

### Task Management

* Create Task
* View Tasks
* Update Task
* Delete Task

### Real-Time Updates

* Real-Time Task Synchronization using Cloud Firestore
* Automatic UI Updates

## Tech Stack

* Flutter
* Firebase Authentication
* Cloud Firestore
* GetX State Management

## Architecture

The project follows a Feature-Based Architecture for better scalability and maintainability.

```text
lib/
├── data/
│   ├── models/
│   ├── services/
│   └── providers/
│
├── utils/
│   ├── constants/
│   ├── helpers/
│   └── widgets/
│
├── feature/
│   ├── auth/
│   │   ├── controller/
│   │   ├── screen/
│   │   └── model/
│   │
│   └── task/
│       ├── controller/
│       ├── screen/
│       └── model/
│
└── main.dart
```

## Setup Instructions

### Clone Repository

```bash
git clone <repository-url>
cd todo_app
```

### Install Dependencies

```bash
flutter pub get
```

### Firebase Setup

1. Create a Firebase Project.
2. Enable Email/Password Authentication.
3. Enable Cloud Firestore.
4. Download and add:

   * google-services.json (Android)
   * GoogleService-Info.plist (iOS)

### Run Project

```bash
flutter run
```

### Build APK

```bash
flutter build apk --release
```

## Packages Used

* firebase_core
* firebase_auth
* cloud_firestore
* get
* flutter_screenutil

## Author

Akshay T
