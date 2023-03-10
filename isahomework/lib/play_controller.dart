import 'package:get/get.dart';
import 'package:isahomework/logic.dart';
import 'Structure.dart';

class PlayController extends GetxController {
  late double boardc;
  late double boardr;
  String myarguments = 'user play';
  Structure s = Structure();
  late Logic l;
  late int counter = 0;
  @override
  void onInit() {
    l = Logic(s: s);
    myarguments = Get.arguments;
    boardc = 10.0;
    boardr = 10.0;
    checklogic();
    super.onInit();
  }

  void checklogic() {
    if (myarguments == 'BFS') {
      l.bfs();
      counter = s.counter;
    } else if (myarguments == 'user play') {
      s.move(s.fortc.value, s.fortr.value);
    } else if (myarguments == 'DFS') {
      l.dfs();
      counter = s.counter;
    } else if (myarguments == 'Dijkstra') {
      l.dijkstra();
      counter = s.counter;
    } else if (myarguments == 'A Star') {
      l.aStar();
      counter = s.counter;
    }
  }
}
