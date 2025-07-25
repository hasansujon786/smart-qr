# Smart QR — Flutter App (Freelance Project)

## 🧭 Overview

**Smart QR** is a fast, minimal Flutter app designed to make scanning and generating QR codes effortless.  
It supports a range of content types — from URLs to contact cards — and features scan history, gallery import, and offline QR generation.  
Built as a solo freelance project, the app focuses on performance, usability, and local-first privacy.

**[View on Google Play](https://play.google.com/store/apps/details?id=com.thinknxtmedia.smart_qr&hl=en)**
_Available for Android via Google Play_

![Smart QR Preview](./design/smart-qr.png)

---

## ✨ Features

- **Scan QR & Barcodes**  
  Use the device camera to scan various QR codes and barcodes instantly.

- **Create Custom QR Codes**  
  Generate QR codes for links, contact details, text, and more.

- **Gallery Scanning**  
  Select an image from your device to extract QR/barcode data.

- **Scan History**  
  All scans are saved locally (via Hive) and can be revisited, copied, shared, or deleted.

- **Export to Gallery**  
  Save any generated QR code directly as an image to your gallery.

- **Dark Mode Support**  
  Fully optimized for both light and dark themes.

---

## 🛠 Tech Stack

- **Framework**: Flutter
- **State Management**: Riverpod
- **Local Storage**: Hive
- **QR Scanning**: `scan`, `images_picker`
- **QR Generation**: `qr_flutter`
- **File/Share Support**: `gallery_saver`, `share_plus`, `url_launcher`

---

## 📁 Project Structure

```
smart_qr/
├── android/              # Android-specific code and build config
├── ios/                  # iOS-specific code and build config
├── lib/                  # Main app source code
│   ├── main.dart         # App entry point
│   ├── models/           # Data models
│   ├── screens/          # App screens (UI views)
│   ├── widgets/          # Reusable components
│   ├── providers/        # State management (Riverpod)
│   └── utils/            # Helper functions and utilities
├── assets/               # Static assets (images, etc.)
│   └── images/
├── design/               # Icons, splash screens, branding
│   └── app_icon/
├── pubspec.yaml          # Project metadata and dependencies
├── README.md             # Project overview and documentation
└── LICENSE               # Project license (CC BY-NC 4.0)
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.10.0

### Installation

```bash
flutter pub get
flutter run
```

---

## 👤 Role

This project was designed and developed by **Hasan Mahmud** as a **solo developer**.

---

## 🧾 Portfolio Note

**Smart QR** is part of my developer portfolio and showcases my ability to design, build, and ship high-quality mobile apps using Flutter.
This project reflects my focus on clean architecture, intuitive UX, and efficient state management.

If you're looking for a Flutter or cross-platform developer who can take ownership and deliver — I'd love to chat.

---

## 📬 Contact

- **Email**: [hasansujon786@gmail.com](mailto:hasansujon786@gmail.com)
- **GitHub**: [github.com/hasansujon786](https://github.com/hasansujon786)
- **Portfolio**: [hasansujon786.github.io](https://hasansujon786.github.io)

---

## 🛡 License

This project is licensed under the **CC BY-NC 4.0 License**.  
You’re welcome to learn from or adapt the code for personal or educational use — commercial use is not permitted.

🔗 [Learn more](https://creativecommons.org/licenses/by-nc/4.0/)
