// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';
import 'dart:math';

import 'package:collection/collection.dart';

import 'Structure.dart';
import 'data structure/stack.dart';

class Logic {
  Structure s;
  Logic({
    required this.s,
  });

  bool isvisited(Point vp) {
    for (int i = 0; i < visited.length; i += 1) {
      if (vp.c == visited[i].c && vp.r == visited[i].r) {
        return true;
      }
    }
    return false;
  }

  bool allvisited(int counter2) {
    for (Point i in thebigvisitedlist[counter2]) {
      if (!isvisited(i)) {
        return false;
      }
    }
    return true;
  }

  bool allvisited2(Point a) {
    for (Point i in s.checkMovesLiatForBFS(a.c, a.r, 10, 10)) {
      if (!isvisited(i)) {
        return false;
      }
    }
    return true;
  }

  Stack dfsstack = Stack();
  late Point newpoint;
  List<Point> visited = [];
  List<List<Point>> thebigvisitedlist = [];
  bool listtoadd = true;
  int counter2 = 0;
  int max = 0;
  void dfs() {
    thebigvisitedlist
        .add(s.checkMovesLiatForBFS(s.fortc.value, s.fortr.value, 10, 12));
    dfsstack.push(Point(r: s.fortr.value, c: s.fortc.value));
    visited.add(Point(r: s.fortr.value, c: s.fortc.value));
    while (!dfsstack.isEmpty()) {
      newpoint = dfsstack.top();

      if (counter2 > max) {
        max = counter2;
      }
      if (s.isFinal(5, 9, s.fortc.value, s.fortr.value)) {
        break;
      }
      if (listtoadd) {
        s.fortc.value = dfsstack.top().c;
        s.fortr.value = dfsstack.top().r;
        while (!s.checkUnder(newpoint.c, newpoint.r, 10) && newpoint.r < 9) {
          s.move(s.fortc.value, s.fortr.value);
          s.fortr.value += 1;
          s.move(s.fortc.value, s.fortr.value);
          newpoint.r += 1;
        }
        s.move(s.fortc.value, s.fortr.value);
        thebigvisitedlist
            .add(s.checkMovesLiatForBFS(newpoint.c, newpoint.r, 10, 12));
      }
      if (!allvisited(max + 1)) {
        listtoadd = true;
        for (int i = 0; i < thebigvisitedlist[max + 1].length; i++) {
          if (!isvisited(thebigvisitedlist[max + 1][i])) {
            dfsstack.push(thebigvisitedlist[max + 1][i]);
            visited.add(thebigvisitedlist[max + 1][i]);
            s.counter++;
            // counter2 = max + 1;
            break;
          }
        }
        counter2++;
      } else {
        dfsstack.pop();
        counter2--;
        listtoadd = false;
      }
    }
  }

  Queue<Point> myQueue = Queue();
  late Point newpoint2;
  late Point test;
  void bfs() {
    s.checkMovesLiatForBFS(s.fortc.value, s.fortr.value, 10, 12);
    myQueue.add(Point(c: s.fortc.value, r: s.fortr.value));
    visited.add(Point(c: s.fortc.value, r: s.fortr.value));
    for (Point i in s.moveableCardListForBFS) {
      myQueue.add(i);
      visited.add(i);
    }
    while (myQueue.isNotEmpty) {
      s.counter++;

      newpoint2 = myQueue.removeFirst();
      s.fortc.value = newpoint2.c;
      s.fortr.value = newpoint2.r;
      s.move(s.fortc.value, s.fortr.value);

      if (s.isFinal(5, 9, s.fortc.value, s.fortr.value)) {
        break;
      }
      while (!s.checkUnder(newpoint2.c, newpoint2.r, 10) && newpoint2.r < 9) {
        s.move(s.fortc.value, s.fortr.value);
        s.fortr.value += 1;
        s.move(s.fortc.value, s.fortr.value);
        newpoint2.r += 1;
      }
      for (Point element
          in s.checkMovesLiatForBFS(newpoint2.c, newpoint2.r, 10, 12)) {
        if (!isvisited(element)) {
          myQueue.add(element);
          visited.add(element);
        }
      }
    }
  }

  List<int> dist = [];
  List<double> pareant = [];
  int c = 0;
  int o = 0;
  bool tfordi = false;
  late int mymin;
  void reAddDist(List<Point> li) {
    for (int i = 0; i < li.length; i++) {
      dist.add(111);
    }
  }

//every row should be defrent by the weight becuse i can't access the num tow row without be in num one so the dijkstra need a litel edites.
  void dijkstra() {
    s.move(s.fortc.value, s.fortr.value);
    s.checkMovesLiatForBFS(s.fortc.value, s.fortr.value, 10, 12);
    dist.add(0);
    for (int i = 1; i < s.moveableCardListForBFS.length; i++) {
      dist.add(1000);
    }
    while (!s.isFinal(5, 9, s.fortc.value, s.fortr.value)) {
      s.counter++;
      if (allvisited2(Point(r: s.fortr.value, c: s.fortc.value))) {
        break;
      }
      mymin = 10000;
      visited.add(Point(r: s.fortr.value, c: s.fortc.value));
      for (int i = 0; i < s.moveableCardListForBFS.length; i++) {
        if (!isvisited(s.moveableCardListForBFS[i])) {
          if (dist[i] < mymin) {
            mymin = dist[i];
            c = i;
          }
        }
      }
      visited.add(s.moveableCardListForBFS[c]);
      for (int i = 0; i < s.moveableCardListForBFS.length; i++) {
        dist[i] = min(dist[i], mymin + 1);
      }
      s.fortc.value = s.moveableCardListForBFS[c].c;
      s.fortr.value = s.moveableCardListForBFS[c].r;
      s.move(s.fortc.value, s.fortr.value);
      while (!s.checkUnder(s.fortc.value, s.fortr.value, 10) &&
          s.fortr.value < 9) {
        s.move(s.fortc.value, s.fortr.value);
        s.fortr.value += 1;
        s.move(s.fortc.value, s.fortr.value);
        tfordi = true;
      }
      if (tfordi) {
        s.checkMovesLiatForBFS(s.fortc.value, s.fortr.value, 10, 12);
        reAddDist(s.moveableCardListForBFS);
        tfordi = false;
      }
    }
  }

  int howManyRow(double mc, double kingr, double fortr) {
    int wallCounter = 0;
    //here we but the king position
    for (double i = fortr; i < kingr; i += 1) {
      for (double j = 0; j < mc; j += 1) {
        if (!s.checkIfWall(j, i)) {
          wallCounter++;
          break;
        }
      }
    }
    return wallCounter;
  }

  List<List<int>> hlist = [];
  // seth is function to set the value to the h(n) for the a star algorithm starting from the row where is the fort is and to the king row.
  // from the test i can say that this function is correct for now .
  void setH() {
    for (int i = 0; i < 10; i += 1) {
      hlist.add([]);
      for (double j = 0; j < 10; j += 1) {
        if (s.checkIfWall(j, i.toDouble())) {
          //if checkUnder is true then there is a wall under this card
          if (s.checkUnder(j, i.toDouble(), 10)) {
            hlist[i].add(howManyRow(10, 9, i.toDouble()));
          } else {
            hlist[i].add(howManyRow(10, 9, i.toDouble()) - 1);
          }
        } else {
          hlist[i].add(1000);
        }
      }
    }
  }

  List<List<int>> glist = [];
  void setG() {
    bool thereIsWall = false;
    for (int i = 0; i < 10; i += 1) {
      glist.add([]);
      for (double j = 0; j < 10; j += 1) {
        if (s.checkIfWall(j, i.toDouble())) {
          if (s.fortc.value == j && s.fortr.value == i) {
            glist[i].add(0);
          } else if (s.checkIfWallUpper(j, i.toDouble(), thereIsWall)) {
            glist[i].add(i.toInt());
          } else if (!s.checkIfWallUpper(j, i.toDouble(), thereIsWall)) {
            glist[i].add(i.toInt() - 1);
          }
        } else {
          thereIsWall = true;
          glist[i].add(1000);
        }
      }
    }
  }

  Fastar getF(int c, int r) {
    Fastar f = Fastar(value: glist[r][c] + hlist[r][c], c: c, r: r);
    return (f);
  }

  // PriorityQueue<Fastar> openSet = PriorityQueue();
  List<Fastar> openSet = [];
  List<Point> closeSet = [];
  bool tfordi2 = false;
  void reAddOpenSet(List<Point> m) {
    openSet.clear();
    for (Point i in m) {
      if (s.fortc.value == i.c && s.fortr.value == i.r) {
        openSet.add(Fastar(
            value: 555, c: s.fortc.value.toInt(), r: s.fortr.value.toInt()));
      } else {
        openSet.add(getF(i.c.toInt(), i.r.toInt()));
      }
    }
  }

  opensetNotempty() {
    for (int i = 0; i < openSet.length; i++) {
      if (openSet[i].value != 555) {
        return true;
      }
    }
    return false;
  }

  //the h list for every situation will set so simolpe on my example becuse every card have a wall inder it will have h=number and the card with no wall will have a h=n-1
  // the card above the final card (the kingK) will have a h=0 and going on like that.
  // the g is the same with the cost in dijkstra
  void aStar() {
    setH();
    setG();
    s.move(s.fortc.value, s.fortr.value);
    openSet.add(Fastar(
        value: glist[s.fortr.value.toInt()][s.fortc.value.toInt()] +
            hlist[s.fortr.value.toInt()][s.fortc.value.toInt()],
        c: s.fortc.value.toInt(),
        r: s.fortr.value.toInt()));
    s.checkMovesLiatForBFS(s.fortc.value, s.fortr.value, 10, 10);
    reAddOpenSet(s.moveableCardListForBFS);

    //if openSet is empty then there is no solution but if we going to win the isFinal function should be true so we will break the while loop.
    int c2 = 0;

    while (opensetNotempty()) {
      s.counter++;
      int mymin2 = 100;
      if (s.isFinal(5, 9, s.fortc.value, s.fortr.value)) {
        break;
      }

      for (int i = 0; i < openSet.length; i++) {
        if (!isvisited(
            Point(r: openSet[i].r.toDouble(), c: openSet[i].c.toDouble()))) {
          if (openSet[i].value < mymin2) {
            mymin2 = openSet[i].value;
            c2 = i;
          } else {
            openSet[i].value = 555;
          }
        }
      }
      closeSet.add(Point(
        r: openSet[c2].r.toDouble(),
        c: openSet[c2].c.toDouble(),
      ));
      s.fortc.value = openSet[c2].c.toDouble();
      s.fortr.value = openSet[c2].r.toDouble();
      s.move(s.fortc.value, s.fortr.value);
      print('s.fortc.value when c2 is :$c2');
      print(s.fortc.value);
      openSet[c2].value = 555;

      while (!s.checkUnder(s.fortc.value, s.fortr.value, 10) &&
          s.fortr.value < 9) {
        s.move(s.fortc.value, s.fortr.value);
        s.fortr.value += 1;
        s.move(s.fortc.value, s.fortr.value);
        tfordi2 = true;
      }
      if (tfordi2) {
        s.checkMovesLiatForBFS(s.fortc.value, s.fortr.value, 10, 12);
        reAddOpenSet(s.moveableCardListForBFS);
        tfordi2 = false;
      }
    }
  }
}

class Fastar {
  int value;
  int c;
  int r;
  Fastar({
    required this.value,
    required this.c,
    required this.r,
  });
}












/*// this function use to test the setH and it's ok for now.
  void geth() {
    setH();

    for (int i = 0; i < hlist.length; i++) {
      for (int j = 0; j < hlist[i].length; j++) {
        print(hlist[i][j]);
      }
    }
  }
//this function use to test the setG and it's correct
  void getg() {
    setG();

    for (int i = 0; i < glist.length; i++) {
      for (int j = 0; j < glist[i].length; j++) {
        print(glist[i][j]);
      }
    }
  }
 */