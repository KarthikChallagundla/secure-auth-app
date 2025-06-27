# 🔐 Biometric + Device Lock Authentication App (Flutter)

This Flutter application demonstrates secure user authentication using **system-level biometrics and device lock screen security** — just like **PhonePe**, **CRED**, and **Google Pay**. It leverages native authentication mechanisms such as fingerprint, face ID, PIN, pattern, or password, and uses encrypted keychain storage for tokens.

---

## 📦 How to Set Up the Project

### 1. Clone the Repository

```bash
git clone https://github.com/KarthikChallagundla/secure-auth-app.git
cd secure-auth-app
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the App

```bash
flutter run
```
## ✨ Key Features Implemented

- **Secure Authentication via OS**
  - Fingerprint
  - Face ID
  - Device PIN, pattern, or password

- **Fallback Support**
  - If biometrics are unavailable, automatically falls back to device lock screen credentials

- **System UI**
  - Native authentication prompt (not custom-built) for security compliance

- **Secure Token Storage**
  - Auth token securely saved via `flutter_secure_storage` (backed by Android Keystore / iOS Keychain)

- **Cross-Platform**
  - Works seamlessly on Android and iOS with minimal platform-specific setup

---

## 📁 Project Structure

```
lib/
├── main.dart
├── screens/
│   ├── login_screen.dart         # Login page with lock screen authentication
│   └── home_screen.dart          # Destination after successful auth
├── services/
│   ├── auth_service.dart         # Handles biometric + device credential logic
│   └── secure_storage_service.dart # Manages secure token storage
```

---

## ⚠️ Limitations & Assumptions

| Type             | Details                                                                 |
|------------------|-------------------------------------------------------------------------|
| 🔒 UI Customization | The lock screen UI is system-controlled and cannot be styled/customized |
| 🔐 Device Requirement | Must test on a **real device** (biometric APIs don't work on emulator)   |
| 🧪 Assumption     | The user has set up at least one device credential (PIN/pattern/biometric) |
| ❌ No In-App PIN  | Does not use or store custom PIN/password inside the app               |

---

## 🧪 Testing Scenarios

| Scenario                     | Expected Result                                  |
|-----------------------------|--------------------------------------------------|
| Fingerprint registered       | System shows fingerprint prompt                 |
| Fingerprint not available    | Falls back to PIN/pattern                       |
| No device lock configured    | Auth fails gracefully with message              |
| Authentication successful    | Token stored securely, navigate to Home screen |
| Authentication cancelled     | Stays on login screen                          |

---

## 🛡️ Security Notes

- Relies entirely on the OS for authentication
- No sensitive credentials handled inside app
- Token is securely encrypted using native keychains

---

## 📅 Assignment Information

- **Assignment Title:** Implement Biometric Login Inside the App
- **Objective:** Enhance app security using biometric/device lock authentication
- **Developer:** Karthik Challagundla
- **Submission:** Includes code, screen recording, and README

---

## ✅ Summary

This app provides a **production-grade, secure authentication system** using the device’s native capabilities. It avoids the pitfalls of insecure in-app credential storage, making it ideal for UPI, banking, or sensitive apps.

