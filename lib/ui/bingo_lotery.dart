import 'package:flutter/material.dart';
import 'package:flutter_bingo_balls/ui/models/marble_model.dart';

class BingoLotery extends StatefulWidget {
  final String id = "bingo_lotery";
  Color color;

  BingoLotery({Key? key, this.color = Colors.white}) : super(key: key);

  @override
  State<BingoLotery> createState() => _BingoLoteryState();
}

class _BingoLoteryState extends State<BingoLotery> {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            height: 60,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: widget.color,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _marble(marble: Marble(number: 20, color: Colors.amber)),
                  _marble(marble: Marble(number: 32, color: Colors.red)),
                  _marble(marble: Marble(number: 76, color: Colors.blue)),
                  _marble(marble: Marble(number: 49, color: Colors.amber)),
                  _marble(marble: Marble(number: 99, color: Colors.red)),
                  _marble(marble: Marble(number: 73, color: Colors.cyan)),
                  _marble(marble: Marble(number: 45, color: Colors.amber)),
                  _marble(marble: Marble(number: 70, color: Colors.red)),
                  _marble(marble: Marble(number: 93, color: Colors.cyan)),
                  //
                ],
              ),
            )),
        FloatingActionButton(onPressed: () {}),
      ],
    );
  }

  _marble({required Marble marble}) {
    return Container(
      height: 33,
      width: 33,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: marble.color,
      ),
      //alignment: Alignment.center,
      child: Center(
          child: Text(
        "${marble.number}",
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      )),
    );
  }
}
