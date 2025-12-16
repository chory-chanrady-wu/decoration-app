# Furniture & Decoration E‑Commerce App

### Presentation Slides (Markdown)

---

## 1) Project Snapshot

- Flutter mobile & web app for furniture/decoration shopping
- KHQR payment (ABA link) + receipt upload
- Material 3 UI, splash screen, cart & checkout

---

## 2) Core Features

- 18 products with ratings; category filter chips
- Quantity dialog with live price updates
- Cart badge, edit/remove items, running total
- Checkout form (validated name/phone/address)
- KHQR payment card (250x250) with ABA QR
- Receipt upload (image_picker) + preview

---

## 3) User Flow

Splash → Home (filter/browse) → Product details →
Cart (edit qty) → Checkout (form + summary) →
Pay via KHQR → Upload receipt → Order complete

---

## 4) Architecture

```
lib/
├─ main.dart            # Entry, theme, splash
├─ models/              # product.dart, cart_item.dart
├─ screens/             # splash, home, detail, cart, checkout
└─ widgets/             # product_card, cart_item_tile
```

State: local setState + callbacks; Navigation: MaterialPageRoute.

---

## 5) Tech Stack

- Flutter 3.10.1+, Dart
- qr_flutter (QR), image_picker (receipts)
- Material Design 3, cross-platform (Android/iOS/Web/Desktop)

---

## 6) Payment & Receipts

- KHQR card with ABA payment URL (scannable QR)
- High-contrast QR (250x250) for reliability
- Receipt upload: gallery picker, preview thumbnail, then complete order

---

## 7) Quick Start

```bash
flutter pub get
flutter run -d windows   # or chrome / android / ios / macos / linux
```

---

## 8) Future Enhancements

- Auth & persistent cart
- Search, price filters, wish list
- Order history & profiles
- Backend/Firebase + notifications

---

## 9) Status

Production-ready UI/UX, no debug banner, clean structure, ready for backend integration.
