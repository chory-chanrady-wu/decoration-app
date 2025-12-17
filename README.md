# Furniture & Decoration Mobile App

## Presentation Document

---

## 📋 Table of Contents

1. Project Overview
2. Features & Functionality
3. Technical Architecture
4. User Interface
5. Payment
6. Technical Stack
7. Project Structure
8. Future Enhancements
9. Quality Assurance
10. Installation & Setup
11. Future Enhancements
12. Conclusion

---

## 1. Project Overview

### Purpose

A modern Flutter-based mobile application for buying and selling furniture and home decoration items with integrated KHQR payment system.

### Target Users

- Customers looking to purchase home furnishings
- Users in Southeast Asia (Cambodia focus - KHQR payment)
- Desktop and mobile device users

### Key Objectives

✅ Provide seamless shopping experience  
✅ Display products with detailed information  
✅ Enable cart management with quantity control  
✅ Integrate secure payment processing  
✅ Capture payment receipts for verification
✅ Intregrated with telegram bot

---

## 2. Features & Functionality

### 2.1 Product Browsing

- **18 High-Quality Products**
  - 8 Furniture items (sofas, tables, shelves, beds)
  - 10 Decoration items (lights, mirrors, plants, wall art)
- **Category Filtering**
  - All / Furniture / Decoration
  - Easy-to-use chip selection
- **Product Details**
  - Product name, price, category
  - Detailed description
  - Star ratings (4.2 - 4.8 stars)
  - High-quality emoji icons

### 2.2 Shopping Cart

- **Cart Item Management**
  - Add/remove items
  - Adjust quantities
  - Real-time total calculation
  - Badge showing item count
- **Visual Feedback**
  - Cart item counter in AppBar
  - Red badge with count
  - Empty cart message

### 2.3 Quantity Selection

- **Interactive Dialogs**
  - Input quantity before adding to cart
  - Real-time price calculation
  - StatefulBuilder for dynamic updates
  - Increment/decrement buttons
- **Works on All Screens**
  - Home screen products
  - Product detail screen

### 2.4 Checkout Process

- **Multi-Step Checkout**
  1. Order Summary Display
  2. Customer Information Form
  3. Invoice Generation (INV-YYYYMMDD-HHMMSS)
  4. Payment Details
  5. Receipt Upload
- **Form Validation**
  - Name: minimum 3 characters
  - Phone: minimum 9 digits, format validation
  - Address: minimum 10 characters
- **Invoice System**
  - Automatic invoice number generation
  - Unique timestamp-based format
  - Included in order confirmation

### 2.5 KHQR Payment Integration

- **Professional Payment Card**
  - Red KHQR branding header
  - Customer name display
  - Order total in large green text
  - High-quality QR code image (250x250px)
- **Payment Link**
  - ABA Bank integration
  - Direct payment URL encoding
  - One-tap payment capability

### 2.6 Receipt Upload & Notifications

- **Image Selection**
  - Gallery/file picker integration
  - Image optimization (max 1920x1920, 85% quality)
- **Receipt Preview**
  - Show uploaded image thumbnail
  - Confirmation before order completion
  - Cross-platform compatible (Image.memory)
- **Telegram Bot Integration**
  - Automatic order notification to merchant
  - Includes invoice number, customer details, and product IDs
  - Receipt filename tracking
  - Real-time order alerts
- **Order Completion**
  - Cart automatically cleared
  - Telegram notification sent
  - Return to home screen
  - Order status confirmation

### 2.7 Splash Screen

- **Professional Loading Screen**
  - Animated fade-in effects
  - 3-second display duration
  - Branded with app icon and title
  - Loading spinner indicator
  - Brown gradient background

---

## 3. Technical Architecture

### 3.1 Project Structure

```
lib/
├── main.dart                    # App entry point
├── models/
│   ├── product.dart            # Product data model
│   ├── cart_item.dart          # Cart item model
│   └── models.dart             # Barrel export
├── screens/
│   ├── splash_screen.dart      # Loading screen
│   ├── home_screen.dart        # Product browsing
│   ├── product_detail_screen.dart  # Product details
│   ├── cart_screen.dart        # Cart management
│   ├── checkout_screen.dart    # Checkout & payment
│   └── screens.dart            # Barrel export
└── widgets/
    ├── product_card.dart       # Product display widget
    ├── cart_item_tile.dart     # Cart item widget
    └── widgets.dart            # Barrel export
```

### 3.2 Data Models

**Product Model**

```dart
class Product {
  final int id;
  final String name;
  final String category;      // "Furniture" or "Decoration"
  final double price;
  final String image;         // Emoji icon
  final String description;
  final double rating;        // 4.0 - 4.8
}
```

**CartItem Model**

```dart
class CartItem {
  final Product product;
  int quantity;               // Mutable for adjustments
}
```

### 3.3 State Management

- **Local setState() Management**
  - HomeScreen manages products and cart
  - CartScreen manages item removal
  - CheckoutScreen manages form state
- **Callback Pattern**
  - onUpdate callbacks for UI refresh
  - Parent-child communication
  - Cross-screen state synchronization

### 3.4 Navigation

- **MaterialPageRoute Navigation**
  - Push/pop navigation stack
  - Modal dialogs for confirmations
  - Splash → Home → Product/Cart → Checkout → Payment → Receipt Upload → Telegram Alert

---

## 4. User Interface

### 4.1 Design System

- **Color Scheme**
  - Primary: Brown (#8B4513)
  - Accent: Green (payment/success)
  - Secondary: Red (KHQR branding)
- **Typography**
  - Material Design 3
  - Consistent font sizes
  - Bold headers, regular body text
- **Components**
  - Material buttons and cards
  - Custom widgets for products
  - Reusable tile components

### 4.2 Screen Layouts

**Splash Screen**

- Centered logo and title
- Fade-in animation
- Loading spinner
- 3-second timer

**Home Screen**

- AppBar with cart icon badge
- Category filter chips
- Grid of product cards (2 columns)
- Floating action or tap to add

**Product Detail Screen**

- Full product information
- Large image/icon
- Description and rating
- Add to cart with quantity

**Cart Screen**

- List of cart items
- Remove button per item
- Total price calculation
- Checkout button

**Checkout Screen**

- Order summary table
- Form fields (name, phone, address)
- KHQR payment card preview
- Upload receipt button

---

## 5. Payment Integration

### 5.1 KHQR Standard Compliance

- **Khmer QR (KHQR) Format**
  - Unique to Cambodia
  - Supported by all major banks
  - ABA, Wing, Bakong compatible
- **QR Code Details**
  - Size: 250x250 pixels
  - High error correction level (30%)
  - White background for contrast
  - No padding for maximum scanability

### 5.2 Payment Flow

1. Customer reviews order
2. System generates unique invoice number
3. Displays KHQR payment card
4. Customer scans QR code with banking app
5. Completes payment in bank app
6. Screenshots payment receipt
7. Uploads receipt image to app
8. System sends Telegram notification to merchant
9. Order confirmed and cart cleared

### 5.3 ABA Bank Integration

- **Payment URL**: `https://pay.ababank.com/.../example`
- **Automatic Opening**: Clicking QR opens bank app
- **Secure**: Direct link to ABA infrastructure
- **User-Friendly**: One-tap payment on mobile

---

## 6. Technical Stack

### 6.1 Framework & Language

- **Flutter** 3.10.1+
- **Dart** for all code
- **Material Design 3**

### 6.2 Dependencies

```yaml
dependencies:
  flutter: sdk: flutter
  cupertino_icons: ^1.0.8
  qr_flutter: ^4.1.0           # QR code generation
  image_picker: ^1.0.7         # Receipt upload
  http: ^1.1.0                 # Telegram bot integration
```

### 6.3 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Windows
- ✅ macOS
- ✅ Linux
- ✅ Web

### 6.4 Key Packages

- **image_picker**: Cross-platform image selection
- **qr_flutter**: Professional QR code generation
- **http**: Telegram API integration for order notifications
- **Material Icons**: 1000+ built-in icons

---

## 7. Project Statistics

### Code Metrics

- **Total Files**: 10 Dart files
- **Lines of Code**: ~1,500 LOC
- **Models**: 2 core data models
- **Screens**: 5 main screens
- **Widgets**: 3 custom reusable widgets

### Product Catalog

- **Total Products**: 18
- **Categories**: 2 (Furniture, Decoration)
- **Price Range**: $29.99 - $499.99
- **Average Rating**: 4.5 stars

### Storage & Assets

- **Assets Folder**: For QR images
- **No Database**: In-memory data
- **Scalable**: Ready for backend integration

---

## 8. Features Demonstration

### Demo Scenario

1. **Splash Screen** (3 seconds)

   - Show: Animated loading screen
   - Effect: Fade-in animation

2. **Browse Products** (Home Screen)

   - Filter by: Furniture/Decoration/All
   - Display: 18 products in grid
   - Action: Tap to view details

3. **Add to Cart**

   - Quantity Dialog: Select 1-5 items
   - Price Update: Real-time calculation
   - Visual: Cart badge updates

4. **Checkout Process**

   - Form: Fill name, phone, address
   - Validation: Real-time feedback
   - Invoice: Auto-generated unique ID
   - Progress: Step-by-step indication

5. **Payment**

   - Display: KHQR card with QR code
   - Action: User scans with bank app
   - Upload: Receipt image capture
   - Preview: Review receipt before confirming

6. **Order Complete**
   - Notification: Telegram alert sent to merchant
   - Details: Invoice number, customer info, products with IDs
   - Confirmation: Success message
   - State: Cart cleared
   - Next: Return to home screen

---

## 9. Quality Assurance

### Testing Coverage

- ✅ Form validation (all fields)
- ✅ Cart calculations (price & quantity)
- ✅ Navigation flows (all screens)
- ✅ Image upload (file handling)
- ✅ State management (updates)
- ✅ Invoice generation (unique IDs)
- ✅ Telegram API integration (notifications)

### Error Handling

- Form field validation with helpful messages
- Image picker error handling
- Navigation state checks (mounted)
- Cross-platform compatibility checks

### UI/UX Features

- No debug banner in production
- Smooth animations and transitions
- Responsive layout for all screens
- Intuitive color scheme and icons

---

## 10. Installation & Setup

### Prerequisites

- Flutter 3.10.1 or higher
- Dart SDK
- Git (optional)

### Quick Start

```bash
# Clone repository
cd decoration

# Get dependencies
flutter pub get

# Run app
flutter run -d windows  # or -d chrome, -d android, etc.
```

### Configuration

- Assets already configured in pubspec.yaml
- No API keys needed (local data)
- Ready for backend integration

---

## 11. Future Enhancements

### Phase 2 Features

- 🔐 User authentication (login/register)
- 💾 Persistent cart (local storage)
- ⭐ Product search functionality
- 🔍 Product filtering by price range
- 📋 Order history tracking
- 👤 User profile management

### Phase 3 Features

- 🗄️ Backend database integration
- 💳 Multiple payment methods
- 📦 Real-time order tracking
- 📧 Email notifications
- 🌟 Product reviews & ratings
- 🎁 Wish list functionality

### Technical Upgrades

- Provider/Riverpod state management
- Firebase integration
- Advanced animations
- Offline mode support
- Push notifications

---

## 12. Conclusion

### Project Achievements

✅ **Fully Functional** - All features working seamlessly  
✅ **Production Ready** - Professional UI/UX  
✅ **Well Structured** - Clean architecture and modular code  
✅ **Scalable** - Ready for backend integration  
✅ **User Friendly** - Intuitive navigation and forms  
✅ **Real-time Notifications** - Telegram bot integration for instant order alerts  
✅ **Invoice System** - Automated invoice generation and tracking

### Business Impact

- 📱 Cross-platform reach (mobile, web, desktop)
- 💰 KHQR payment integration (Cambodia market ready)
- 🛍️ Complete e-commerce solution
- � Real-time order notifications via Telegram
- 📝 Automated invoice generation and tracking
- �� Foundation for business growth

### Technical Excellence

- Modern Flutter practices
- Material Design 3 compliance
- Clean code architecture
- Performance optimized

---

## Contact & Support

For questions or improvements, refer to the project documentation or contact the development team.

**Project Completed**: December 148, 2025  
**Status**: Production Ready ✅  
**Version**: 1.10
