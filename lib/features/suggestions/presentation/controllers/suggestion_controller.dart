// ignore_for_file: prefer_initializing_formals
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/document_suggestion.dart';
import '../../data/repositories/suggestion_repository_impl.dart';

class SuggestionListState {
  final List<DocumentSuggestion> suggestions;
  final bool isLoading;
  final String? error;
  final String? statusFilter;

  const SuggestionListState({
    this.suggestions = const [],
    this.isLoading = false,
    this.error,
    this.statusFilter,
  });

  SuggestionListState copyWith({
    List<DocumentSuggestion>? suggestions,
    bool? isLoading,
    String? error,
    String? statusFilter,
    bool clearError = false,
  }) {
    return SuggestionListState(
      suggestions: suggestions ?? this.suggestions,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      statusFilter: statusFilter ?? this.statusFilter,
    );
  }
}

class SuggestionController extends StateNotifier<SuggestionListState> {
  final SuggestionRepositoryImpl _repository;

  SuggestionController({required SuggestionRepositoryImpl repository})
    : _repository = repository,
      super(const SuggestionListState());

  Future<void> load({String? status}) async {
    state = state.copyWith(
      isLoading: true,
      clearError: true,
      statusFilter: status,
    );

    try {
      final suggestions = await _repository.listMy(status: status);
      state = state.copyWith(suggestions: suggestions, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<String?> create({
    required String filePath,
    required String comment,
    String? title,
    String? authors,
    String? url,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      await _repository.create(
        filePath: filePath,
        userComment: comment,
        title: title,
        authors: authors,
        url: url,
      );
      state = state.copyWith(isLoading: false);
      return null;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return e.toString();
    }
  }

  Future<DocumentSuggestion> update(
    String id, {
    String? title,
    String? authors,
    String? url,
    String? userComment,
  }) async {
    final updated = await _repository.update(
      id,
      title: title,
      authors: authors,
      url: url,
      userComment: userComment,
    );
    await load(status: state.statusFilter);
    return updated;
  }

  Future<DocumentSuggestion> replaceFile(String id, String filePath) async {
    final updated = await _repository.replaceFile(id, filePath);
    await load(status: state.statusFilter);
    return updated;
  }

  Future<void> delete(String id) async {
    try {
      await _repository.delete(id);
      await load(status: state.statusFilter);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
