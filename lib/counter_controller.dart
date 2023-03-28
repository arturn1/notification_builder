import 'package:flutter/material.dart';

class CounterNotifier {

  static final CounterNotifier instance = CounterNotifier._();
  CounterNotifier._();

  ValueNotifier valueNotifier = ValueNotifier(0);


  int get getValueVN => valueNotifier.value;

  void decrement() {
    valueNotifier.value--;
  }

  void increment(){
    valueNotifier.value++;
  }

  void set30(){
    valueNotifier.value = 30;
  }

}

class Counter extends ValueNotifier<int>{
  Counter() : super(0);

  increment() => value++;
}

class CounterController extends ChangeNotifier {

  static final CounterController instance = CounterController._();
  CounterController._();

  var _counter = 0;

  void increment(){
    _counter++;
    notifyListeners();
  }

  int get counter => _counter;

}

ValueNotifier<int> counterOut = ValueNotifier<int>(0);

void increment() {
  counterOut.value++;
}

int get getValue => counterOut.value;
