class ChatStorage {
  Future<List<Map<String, dynamic>>> loadChatHistory(String userId) async {
    // Temporary stub — will be fully implemented in Phase 2
    return [];
  }

  Future<void> saveChatHistory(
    String userId,
    List<Map<String, dynamic>> messages,
  ) async {
    // Temporary stub — will be fully implemented in Phase 2
  }

  Future<void> clearChatHistory(String userId) async {
    // Temporary stub — will be fully implemented in Phase 2
  }
}
