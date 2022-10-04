import 'package:flutter/material.dart';
import 'package:flutter_bingo_balls/ui/marble_lotery.dart';
import 'package:flutter_bingo_balls/ui/models/list_marbles.dart';
import 'package:flutter_bingo_balls/ui/models/marble_model.dart';

class CustomBingoLotery extends StatefulWidget {
  final Color backgroundColor;
  final double height;
  final ListMarbles listMarbles;
  const CustomBingoLotery(
      {Key? key,
      this.backgroundColor = Colors.white,
      this.height = 56,
      required this.listMarbles})
      : super(key: key);

  @override
  State<CustomBingoLotery> createState() => _CustomBingoLoteryState();
}

class _CustomBingoLoteryState extends State<CustomBingoLotery> {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    return Container(
      height: widget.height,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        color: widget.backgroundColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(45),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var i = index-1;
            var w = widget.listMarbles.list.reversed.map((e) => MarbleLotery(number: e.number ,color: e.color, sizeCircle: 45)).toList().elementAt(index);
            return w;
          },
          itemCount: widget.listMarbles.list.length-1, // no muestra el primer elemento ingresado por defecto
          separatorBuilder: (context, index) => const SizedBox(
            width: 4,
          ),
        ),
      ),
    );
  }
}

class ContainerBingoLotery extends Container {
  final Color backgroundColor;
  final double height;
  final List<MarbleLotery> listMarbles;
  ContainerBingoLotery(
      {Key? key,
      this.backgroundColor = Colors.white,
      this.height = 56,
      required this.listMarbles})
      : super(
          key: key,
          height: height,
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            color: backgroundColor,
          ),
        );
  @override
  Widget build(BuildContext context) {
    return Container(); //nose
  }
}
