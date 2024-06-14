import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier {
  int _setCount = 0;
  int get setCount => _setCount;

  void setSetCount(int value) {
    _setCount = value;
    notifyListeners();
  }

  void decrement() {
    if (_setCount > 0) {
      _setCount--;
      notifyListeners();
    }
  }

  void increment() {
    if (_setCount < 9999) {
      _setCount++;
      notifyListeners();
    }
  }
}
