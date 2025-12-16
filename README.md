# Furniture & Decoration E-Commerce App

Modern Flutter app for browsing, purchasing, and paying for furniture and decoration items with KHQR support and receipt upload.

## 📌 Highlights

- 18 curated products (Furniture & Decoration) with ratings
- Cart with quantity dialogs and live totals
- Checkout with validation (name, phone, address)
- KHQR payment card + scannable QR (ABA link)
- Receipt upload & preview (cross-platform)
- Splash screen, Material 3 theme, no debug banner

## 🚀 Quick Start

```bash
flutter pub get
flutter run -d windows   # or chrome / android / ios / macos / linux
```

## 🧭 App Flow

Splash → Home (browse/filter) → Product details → Cart → Checkout → QR payment → Upload receipt → Order complete

## 📂 Project Structure

```
lib/
├─ main.dart                # Entry, theme, splash
├─ models/                  # product.dart, cart_item.dart, models.dart
├─ screens/                 # splash, home, product detail, cart, checkout
└─ widgets/                 # product_card, cart_item_tile
```

## 🔑 Core Features

- Product grid with category filter chips (All/Furniture/Decoration)
- Quantity dialog with real-time price update
- Cart badge count in AppBar, remove/edit quantities
- Checkout summary + form validation (min lengths & phone pattern)
- KHQR payment card (250x250) with ABA payment URL
- Receipt upload via image picker, preview thumbnail
- Cart cleared after successful receipt upload/complete order

## 🛠️ Stack

- Flutter 3.10.1+, Dart
- qr_flutter (QR), image_picker (receipts)
- Material Design 3, local setState

## 📱 Supported Platforms

Android • iOS • Web • Windows • macOS • Linux

## 🔮 Future Enhancements

- Auth, persistent cart, search, price filters
- Order history, profiles, multiple payments
- Backend/Firebase integration, notifications

## 📄 License

Private/student project. Update as needed for production.
