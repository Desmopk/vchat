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

---

## 📦 Installation

### Prerequisites

- Flutter SDK installed: [Flutter Setup](https://docs.flutter.dev/get-started/install)
- WebSocket server (i am using a Node.js backend you can use any websocket supported backend.)

### Steps

1. **Clone the repo**:

```bash
git clone https://github.com/Desmopk/vchat.git
cd vchat
Open the file where WebSocket connection is initialized (e.g., chat_service.dart) and set the correct WebSocket server URL:

dart
Copy
Edit
final _channel = WebSocketChannel.connect(
  Uri.parse('ws://your-server-address:port'),
);
