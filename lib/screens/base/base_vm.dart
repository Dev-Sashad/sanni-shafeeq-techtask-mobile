import 'package:flutter/material.dart';
import '../../_lib.dart';

class BaseModel extends ChangeNotifier {
  final ProgressService _dialogService = locator<ProgressService>();
  ProgressResponse hh = ProgressResponse(confirmed: false);

  LoadingState _loadingState = LoadingState.idle;
  LoadingState get loadingstate => _loadingState;
  setLoading(LoadingState value) {
    _loadingState = value;
    if (value.isLoading) {
      _dialogService.showDialog();
    } else {
      _dialogService.dialogComplete(hh);
    }
    notifyListeners();
  }
}

// final List<String> ingre = StateProvider.autoDispose((ref) => '');
