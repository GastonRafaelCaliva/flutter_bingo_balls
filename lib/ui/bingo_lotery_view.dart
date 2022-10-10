import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bingo_balls/ui/custom_bingo_lotery.dart';
import 'package:flutter_bingo_balls/ui/marble_lotery.dart';
import 'package:flutter_bingo_balls/ui/models/marble_model.dart';

class BingoLoteryView extends StatefulWidget {
  final String id = "bingo_lotery_view";

  const BingoLoteryView({Key? key}) : super(key: key);

  @override
  State<BingoLoteryView> createState() => _BingoLoteryViewState();
}

class _BingoLoteryViewState extends State<BingoLoteryView> {
  List<MarbleLotery> listMarbles=[];
  List<int> listNumber = [];
  MarbleLotery aux = ;
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
    print("Añadiendo numero");
    listNumber.add(_numberUnique());
    print(listNumber);
  }

  double opacity = 1;

  Alignment locationA = const Alignment(0, 0);
  Alignment locationB = const Alignment(-0.955, -1.48);
  late Alignment currentLocation = locationA;

  double sizeCircleA = 120;
  double sizeCircleB = 40;
  late double currentSizeCircle = sizeCircleA;

  _addMarble() {
    /*
    if (listNumber.length < 90) {
      _addNumber();
      listMarbles.add( Marble(
          number: listNumber.last,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          sizeCircle: 40));

    } else {
      print("lista llena");
    }*/

  }

  _animation() {
    opacity = opacity == 1 ? 0 : 1;
    currentLocation = currentLocation == locationA ? locationB : locationA;
    currentSizeCircle =
        currentSizeCircle == sizeCircleA ? sizeCircleB : sizeCircleA;
  }

  _endAnimation() {
    setState(() {
      _addMarble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bolillero"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomBingoLotery(
              backgroundColor: Colors.red,
              listMarbles: listMarbles,

            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 240,
                  child: AnimatedAlign(
                    onEnd: () {
                      _endAnimation();
                    },
                    duration: const Duration(milliseconds: 600),
                    alignment: currentLocation,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      width: currentSizeCircle,
                      height: currentSizeCircle,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: MarbleLotery(
                          number:_numberUnique(),//listMarbles[listMarbles.length-1].number,
                          color: Colors.red.withOpacity(opacity),
                          sizeCircle: currentSizeCircle),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(60),
                  child: const SizedBox(
                    height: 120,
                    width: 120,
                  ),
                  onTap: () {
                    setState(() {
                      _animation();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            FloatingActionButton(
                child: const Icon(Icons.add_box),
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
