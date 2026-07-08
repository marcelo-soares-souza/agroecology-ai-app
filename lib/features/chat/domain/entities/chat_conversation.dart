class ChatConversation {
  final String id;
  final String title;
  final String status;
  final int messageCount;
  final String? lastMessagePreview;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime lastMessageAt;

  const ChatConversation({
    required this.id,
    required this.title,
    required this.status,
    required this.messageCount,
    this.lastMessagePreview,
    required this.createdAt,
    required this.updatedAt,
    required this.lastMessageAt,
  });

  ChatConversation copyWith({
    String? title,
    String? status,
    int? messageCount,
    String? lastMessagePreview,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastMessageAt,
  }) {
    return ChatConversation(
      id: id,
      title: title ?? this.title,
      status: status ?? this.status,
      messageCount: messageCount ?? this.messageCount,
      lastMessagePreview: lastMessagePreview ?? this.lastMessagePreview,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastMessageAt: lastMessageAt ?? this.lastMessageAt,
    );
  }
}
