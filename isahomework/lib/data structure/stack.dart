import 'package:isahomework/Structure.dart';

class Stack {
  List<Point> stackimp = [];
  void push(Point stackpoint) {
    stackimp.add(stackpoint);
  }

  Point pop() {
    Point p = stackimp.last;
    stackimp.remove(stackimp.last);
    return p;
  }

  Point top() {
    return stackimp.last;
  }

  bool isEmpty() {
    return stackimp.isEmpty;
  }

  void clear() {
    stackimp.clear();
  }
}
