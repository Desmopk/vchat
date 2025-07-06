# vchat 💬

A real-time live chat application built with **Flutter** using **WebSockets** for seamless and fast communication.

---

## 🚀 Features

- 🔗 Real-time messaging using WebSocket
- 🧑‍🤝‍🧑 Live chat between users
- 📱 Beautiful and responsive UI with Flutter
- 🌐 Server-client architecture (WebSocket backend required)

---

## 🛠️ Tech Stack

- **Frontend**: Flutter (Dart)
- **Real-time Communication**: WebSocket
- **Backend (User's Choice)**: Node.js WebSocket server (or any WebSocket-supporting backend)

---

## 📦 Installation

### ✅ Prerequisites

- Flutter SDK installed: [Flutter Setup Guide](https://docs.flutter.dev/get-started/install)
- Node.js or any WebSocket backend running
- An emulator or real device to run the Flutter app

---

### 🔧 Steps

#### 1. Clone the Repo

```bash
git clone https://github.com/Desmopk/vchat.git
cd vchat
```
#### 2. Install Dependencies
```bash
flutter pub get
```
#### 3. Configure WebSocket Endpoint
Open the file where WebSocket connection is initialized (e.g., chat_service.dart) and update with your backend URL:
```bash
final _channel = WebSocketChannel.connect(
  Uri.parse('ws://your-server-address:port'),
);
```
#### 4. Run the App
```bash
flutter run
```
📁 Project Structure
```bash
vchat/
├── lib/
│   ├── main.dart                   # Entry point
│   ├── screens/
│   │   ├── login_screen.dart       # User login UI
│   │   └── chat_screen.dart        # Main chat screen
│   ├── services/
│   │   └── chat_service.dart       # WebSocket connection logic
│   ├── widgets/
│   │   ├── message_bubble.dart     # UI widget for individual message
│   │   └── message_input.dart      # UI widget for sending messages
│   └── models/
│       └── message_model.dart      # Model class for message objects
├── pubspec.yaml                    # Flutter dependencies
└── README.md                       # Project documentation
```
