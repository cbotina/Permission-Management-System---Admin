import 'dart:async';
import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchQueryNotifier extends StateNotifier<String> {
  Timer? _debounceTimer;

  SearchQueryNotifier() : super('');

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void setQuery(String query) {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(seconds: 1), () {
      log('debounce state: $query');
      state = query;
    });
  }
}

final searchQueryController =
    StateNotifierProvider<SearchQueryNotifier, String>((ref) {
  return SearchQueryNotifier();
});
