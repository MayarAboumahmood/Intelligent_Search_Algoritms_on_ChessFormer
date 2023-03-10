// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isahomework/fort.dart';
import 'package:isahomework/point_for_move.dart';
import 'component/card.dart';

class Point {
  double r;
  double c;

  Point({
    required this.r,
    required this.c,
  });
}

bool tt = true;

class Structure {
  RxDouble fortr = 1.0.obs;
  RxDouble fortc = 1.0.obs;
  int counter = 0;
  static List<Point> wall = [
    Point(r: 2, c: 0),
    Point(r: 2, c: 1),
    Point(r: 2, c: 2),
    Point(r: 2, c: 3),
    Point(r: 2, c: 4),
    Point(r: 2, c: 5),
    Point(r: 2, c: 7),
    Point(r: 2, c: 8),
    Point(r: 2, c: 9),
    Point(r: 3, c: 5),
    // Point(r: 4, c: 3),
    Point(r: 3, c: 7),
    //------------------//
    Point(r: 5, c: 0),
    Point(r: 5, c: 1),
    Point(r: 5, c: 6),
    Point(r: 5, c: 3),
    Point(r: 5, c: 4),
    Point(r: 5, c: 5),
    Point(r: 5, c: 7),
    Point(r: 5, c: 8),
    Point(r: 5, c: 9),
    Point(r: 6, c: 1),
    Point(r: 6, c: 3),
    //------------------//
    Point(r: 8, c: 0),
    Point(r: 8, c: 1),
    Point(r: 8, c: 6),
    Point(r: 8, c: 3),
    Point(r: 8, c: 2),
    Point(r: 8, c: 4),
    Point(r: 8, c: 7),
    Point(r: 8, c: 8),
    Point(r: 8, c: 9),
    Point(r: 9, c: 4),
    Point(r: 9, c: 6),
  ];

  // checkIfWall is a function to see if the sending point is a wall or not and return false if it wall
  bool checkIfWall(double c, double r) {
    bool t = true;
    tt = true;
    for (int i = 0; i < wall.length; i++) {
      if (c == wall[i].c && r == wall[i].r) {
        t = false;
        tt = false;
      }
    }
    return t;
  }

//checkCard is a functing to test if the sendign card is a valied card to move on or not.
  bool checkCard(double cardc, double cardr, double mc, double mr) {
    if (cardc > mc || cardr > mr || !checkIfWall(cardc, cardr)) {
      return false;
    }
    return true;
  }

  bool visitedByLogic(double c, double r) {
    for (int i = 0; i < positionsList.length; i++) {
      if (positionsList[i].left == c && positionsList[i].top == r) {
        return true;
      }
    }
    return false;
  }

  // boar using to definding the board
  List<Widget> board(double r, double c) {
    List<MyCard> myList = [];
    for (double i = 0; i < r; i += 1) {
      for (double j = 0; j < c; j += 1) {
        if (visitedByLogic(j, i)) {
          myList.add(MyCard(cardColor: Colors.red, top: i, left: j));
        } else if (!checkIfWall(j, i)) {
          myList.add(MyCard(cardColor: Colors.green, top: i, left: j));
        } else if ((j + i) % 2 == 0) {
          myList.add(MyCard(cardColor: Colors.grey, top: i, left: j));
        } else {
          myList.add(MyCard(cardColor: Colors.black54, top: i, left: j));
        }
      }
    }
    return myList;
  }

//mc is the last column card in the board.

//checkMoves is a function to generat a list of card that the fort can move to.
  List<PointForMove> moveableCardList = [];
  List<Widget> checkMovesLiat(double c, double r, double mc, double mr) {
    moveableCardList.clear();
    for (double i = c - 1; i >= 0; i -= 1) {
      if (tt == false) {
        tt = true;
        break;
      } else if (checkCard(i, r, mc, mr)) {
        moveableCardList.add(PointForMove(
          left: i,
          top: r,
        ));
      }
    }
    for (double i = c + 1; i < mc; i += 1) {
      if (tt == false) {
        tt = true;
        break;
      } else if (checkCard(i, r, mc, mr)) {
        moveableCardList.add(PointForMove(
          left: i,
          top: r,
        ));
      }
    }
    return moveableCardList;
  }

  List<Point> moveableCardListForBFS = [];
  List<Point> checkMovesLiatForBFS(double c, double r, double mc, double mr) {
    moveableCardListForBFS.clear();
    for (double i = c - 1; i >= 0; i -= 1) {
      if (tt == false) {
        tt = true;
        break;
      } else if (checkCard(i, r, mc, mr)) {
        moveableCardListForBFS.add(Point(
          c: i,
          r: r,
        ));
      }
    }
    for (double i = c + 1; i < mc; i += 1) {
      if (tt == false) {
        tt = true;
        break;
      } else if (checkCard(i, r, mc, mr)) {
        moveableCardListForBFS.add(Point(
          c: i,
          r: r,
        ));
      }
    }
    return moveableCardListForBFS;
  }

  bool checkIfMoveable(double c, double r) {
    for (double i = 0; i < moveableCardList.length; i += 1) {
      if (c == moveableCardList[i.toInt()].left &&
          r == moveableCardList[i.toInt()].top) {
        return true;
      }
    }
    return false;
  }

  List<Fort> positionsList = [];
  Fort move(double c, double r) {
    if (checkIfMoveable(c, r)) {
      while (!checkUnder(c, fortr.value, 10) && fortr.value < 9) {
        fortr.value += 1;
      }
      positionsList.add(Fort(left: c, top: fortr.value));

      return Fort(left: c, top: fortr.value);
    } else {
      positionsList.add(Fort(left: fortc.value, top: fortr.value));

      return Fort(left: fortc.value, top: fortr.value);
    }
  }

// if checkUnder is true then there is a wall under the fort
  bool checkUnder(double fortc, double fortr, double mc) {
    if (checkIfWall(fortc, fortr + 1)) {
      return false;
    }
    tt = true;
    return true;
  }

// this function return false if there is no wall upper and return true if there is a wall .
  bool checkIfWallUpper(
      // for some reason this function alwase return true it's never go inside the if condetion.
      double fortc,
      double fortr,
      bool thereIsWall) {
    bool t = true;
    while (checkIfWall(fortc, fortr)) {
      if (fortr == 0) {
        break;
      }
      if (thereIsWall &&
              (!checkIfWall(fortc + 1, fortr) &&
                  !checkIfWall(fortc + 2, fortr) &&
                  checkIfWall(fortc, fortr)) ||
          !checkIfWall(fortc - 1, fortr) &&
              !checkIfWall(fortc - 2, fortr) &&
              checkIfWall(fortc, fortr)) {
        t = false;
        break;
      }
      fortr -= 1;
    }
    return t;
  }

  bool isFinal(double kingc, double kingr, double fortc, double fortr) {
    return (kingc == fortc && kingr == fortr);
  }
}
