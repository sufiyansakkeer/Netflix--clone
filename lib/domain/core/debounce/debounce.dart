import 'package:flutter/foundation.dart';
import 'dart:async';

//* here we use debouncer to make refresh the items by scrolling up at the top
class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
