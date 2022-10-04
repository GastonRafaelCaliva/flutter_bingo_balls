import 'package:flutter/material.dart';

class MarbleLotery extends StatefulWidget {
  Color color;
  int number;
  double sizeCircle;
  MarbleLotery(
      {Key? key,
      this.color = Colors.white,
      required this.number,
      this.sizeCircle = 90})
      : super(key: key);

  @override
  State<MarbleLotery> createState() => _MarbleLoteryState();
}

class _MarbleLoteryState extends State<MarbleLotery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.sizeCircle,
      width: widget.sizeCircle,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.color,
      ),
      //alignment: Alignment.center,
      child: Center(
        child: Text(
          "${widget.number}",
          style: TextStyle(
            color: Colors.white,
            fontSize: widget.sizeCircle > 36
                ? widget.sizeCircle / 3
                : widget.sizeCircle / 2,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}