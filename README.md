# 🍔 Food Foodie

A Flutter-based mobile application that demonstrates a basic food ordering workflow using Firebase as the backend.

This project focuses on implementing core app features like authentication, state management, and cart handling in a structured and maintainable way.

---

## 📱 Screenshots

### 🏠 Home Page (Light Mode)
<img src="https://github.com/user-attachments/assets/b3f5d35f-408c-491e-be9b-442686f380c2" width="250"/>

### 🌙 Home Page (Dark Mode)
<img src="https://github.com/user-attachments/assets/5c14a8a1-c463-47da-b20c-e38c689a3e33" width="250"/>

### 👤 Profile Page
<img src="https://github.com/user-attachments/assets/cbddecaf-fec6-46e9-8b32-d32a81ebbf50" width="250"/>

### 🛒 Cart Page
<img src="https://github.com/user-attachments/assets/0de39101-5150-49b5-9f08-9ca324bbdb9c" width="250"/>

### ⚙️ Settings Page
<img src="https://github.com/user-attachments/assets/7cbf263d-bbea-40d1-98ee-8ca7b6653bc6" width="250"/>

### 🔐 Login Page
<img src="https://github.com/user-attachments/assets/02ddff78-e4ef-4063-9c71-0eb4fc5ad538" width="250"/>

### 📝 Signup Page
<img src="https://github.com/user-attachments/assets/95145e5d-2ee5-42ed-a82d-e42de33c5b32" width="250"/>

---

## 🚀 Features

- User Authentication (Firebase Email/Password)
- Persistent Login (Auto-login)
- Food Menu Display
- Add to Cart / Remove from Cart
- Real-time Price Calculation
- Simple Order Placement Flow
- State Management using Provider

---

## 🛠️ Tech Stack

**Frontend**
- Flutter (Dart)

**State Management**
- Provider

**Backend**
- Firebase Authentication  
- Firebase Realtime Database / Firestore  

---

## 📂 Project Structure
lib/
│
├── models/
│   ├── cart_model.dart
│   └── food_model.dart
│
├── provider/
│   ├── cart_provider.dart
│   └── darkmode_theme_provider.dart
│
├── screens/
│   ├── cart_screen.dart
│   ├── home_screen.dart
│   ├── user_login_screen.dart
│   └── user_signup_screen.dart
│
├── services/
│   ├── firebase_service.dart
│   ├── logout.dart
│   └── splash_logic.dart
│
├── settings/
│   ├── profile_settings_screen/
│   │   └── profile_screen.dart
│   └── settings.dart
│
├── firebase_options.dart
└── main.dart


---

## ⚙️ Setup Instructions

### 1. Clone Repository
git clone https://github.com/your-username/mini_food_ordering.git
cd mini_food_ordering

###2. Install Dependencies
flutter pub get
