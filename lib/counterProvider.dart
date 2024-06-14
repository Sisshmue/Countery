import 'package:flutter/material.dart';

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

  int count = 0;
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;

  void increaseCount() {
    if (count < 9) {
      count++;
      notifyListeners();
    } else if (count1 < 9) {
      count = 0;
      count1++;
      notifyListeners();
    } else if (count2 < 9) {
      count = 0;
      count1 = 0;
      count2++;
      notifyListeners();
    } else if (count3 < 9) {
      count = 0;
      count1 = 0;
      count2 = 0;
      count3++;
      notifyListeners();
    }
  }

  void decreaseCount() {
    if (count == 0 && count1 == 0 && count2 == 0 && count3 == 0) {
      count = count1 = count2 = 0;
    } else if (count == 0) {
      if (count1 == 0) {
        if (count2 == 0) {
          if (count3 > 0) {
            count3 = count3 - 1;
            count2 = 9;
            count1 = 9;
            count = 10;
            count--;
            notifyListeners();
          }
        } else if (count2 > 0) {
          count2 = count2 - 1;
          count1 = 9;
          count = 10;
          count--;
          notifyListeners();
        }
      } else if (count1 > 0) {
        count1 = count1 - 1;
        count = 10;
        count--;
        notifyListeners();
      }
    } else {
      count--;
      notifyListeners();
    }
  }

  void reset() {
    count = 0;
    count1 = 0;
    count2 = 0;
    count3 = 0;
    notifyListeners();
  }

  bool isSwitch = true;
  void setSetSwitch(bool value) {
    isSwitch = value;
    notifyListeners();
  }
}
