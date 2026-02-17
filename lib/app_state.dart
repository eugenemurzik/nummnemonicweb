import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _currentPageIndex = 1;
  int get currentPageIndex => _currentPageIndex;
  set currentPageIndex(int value) {
    _currentPageIndex = value;
  }

  bool _isSidebarOpen = false;
  bool get isSidebarOpen => _isSidebarOpen;
  set isSidebarOpen(bool value) {
    _isSidebarOpen = value;
  }
}
