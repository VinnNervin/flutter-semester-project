
---

## Prerequisites

Pastikan environment kamu sudah siap:

* Flutter SDK (latest stable)
* Android Studio / VS Code
* Android Emulator atau device fisik
* (Optional) Xcode untuk iOS

Cek instalasi:

```bash
flutter doctor
```

---

## Installation

Clone repository:

```bash
git clone https://github.com/VinnNervin/flutter-semester-project.git
```

Install dependencies:

```bash
flutter pub get
```

---

## Jalankan Aplikasi (Debug Mode)

Jalankan aplikasi:

```bash
flutter run
```

atau

```bash
flutter run -d <nama_device_tersedia>
```

> Debug mode digunakan saat development karena mendukung hot reload dan debugging ([Dokumentasi Flutter][1])

---

## Build APK (Android)

### Debug APK

```bash
flutter build apk --debug
```

### Release APK

```bash
flutter build apk --release
```

Output:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

## Build iOS (Mac Only)

```bash
flutter build ios
```

Note:

* Harus pakai macOS
* Butuh Xcode
* Untuk publish ke App Store perlu signing

---

## Troubleshooting

### 1. Dependency error

```bash
flutter clean
flutter pub get
```

### 2. Device tidak terdeteksi

```bash
flutter devices
```

### 3. Error build

```bash
flutter doctor
```

---

## Contributing

1. Fork repo
2. Create branch
3. Commit changes
4. Push & PR

---

## License

MIT License


---

## Official Resources

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


[1]: https://docs.flutter.dev/testing/build-modes "Flutter's build modes"