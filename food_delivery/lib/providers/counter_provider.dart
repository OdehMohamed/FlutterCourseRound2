import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 1;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter > 1) {
      _counter--;
      notifyListeners();
    }
  }

  void reset() {
    _counter = 1;
    notifyListeners();
  }
}