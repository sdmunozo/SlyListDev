// models/chat.dart

class Chat {
  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final DateTime timestamp;

  Chat({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });
}
