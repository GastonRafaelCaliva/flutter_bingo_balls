import 'dart:collection';
import 'package:flutter_bingo_balls/ui/models/marble_model.dart';
import 'package:flutter/material.dart';

class ListMarbles {
  List<Marble> list;
  ListMarbles({required this.list});
  addLMarbles(Marble marble){
    list.add(marble);
  }
}