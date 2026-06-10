import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';
import '../../features/chat/domain/entities/chat_message.dart';

class ChatStorage {
  Future<List<ChatMessage>> loadChatHistory(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = '${AppConstants.chatStorageKey}_$userId';
      final raw = prefs.getString(key);
      if (raw == null) return [];

      final list = jsonDecode(raw) as List;
      final messages = list
          .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList();

      if (messages.length > AppConstants.chatLocalStorageMaxMessages) {
        return messages.sublist(
          messages.length - AppConstants.chatLocalStorageMaxMessages,
        );
      }

      return messages;
    } catch (_) {
      return [];
    }
  }

  Future<void> saveChatHistory(
    String userId,
    List<ChatMessage> messages,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = '${AppConstants.chatStorageKey}_$userId';

      final trimmed = messages.length > AppConstants.chatLocalStorageMaxMessages
          ? messages.sublist(
              messages.length - AppConstants.chatLocalStorageMaxMessages,
            )
          : messages;

      final raw = jsonEncode(trimmed.map((m) => m.toJson()).toList());
      await prefs.setString(key, raw);
    } catch (_) {}
  }

  Future<void> clearChatHistory(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = '${AppConstants.chatStorageKey}_$userId';
      await prefs.remove(key);
    } catch (_) {}
  }
}
