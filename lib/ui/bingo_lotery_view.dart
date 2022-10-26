import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bingo_balls/ui/custom_bingo_hype.dart';

class BingoLoteryView extends StatefulWidget {
  final String id = "bingo_lotery_view";

  const BingoLoteryView({Key? key}) : super(key: key);

  @override
  State<BingoLoteryView> createState() => _BingoLoteryViewState();
}

class _BingoLoteryViewState extends State<BingoLoteryView> {
  List<Marble> listMarbles = [];
  List<int> listNumber = [];
  Random rnd = Random();
  _numberUnique() {
    bool flag = false;
    int random = 0;
    if (listNumber.isEmpty) {
      return rnd.nextInt(89) + 1;
    }
    while (!flag) {
      random = rnd.nextInt(89) + 1;
      flag = !listNumber.contains(random);
    }
    return random;
  }

  _addNumber() {
    listNumber.add(_numberUnique());
    print("Añadiendo numero");
    print(listNumber);
  }

  double sizeCircleA = 120;
  double sizeCircleB = 40;
  late double currentSizeCircle = sizeCircleA;

  _addMarble() {
    if (listNumber.length < 90) {
      _addNumber();
      listMarbles.add(Marble(
        number: listNumber.last,
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ));
    } 
    else {
      print("lista llena");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple.shade100,
        appBar: AppBar(
          title: const Text("Bingo"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              child: CustomBingoHype( listMarbles: listMarbles,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            FloatingActionButton(
                child: const Icon(Icons.add_circle),
                onPressed: () {
                  setState(() {
                    _addMarble();
                  });
                }),
          ],
        ),
      ),
    );
  }
}
