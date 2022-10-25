import 'dart:math';

import 'package:flutter/material.dart';
import 'models/marble_model.dart';
import 'package:auto_animated/auto_animated.dart';

class WidgetBingo extends StatefulWidget {
  final List<Marble>? listMarbles;
  final double padding;
  final double height;
  final double width;
  final Color backgroundColor;
  final double? borderRadius;
  const WidgetBingo({
    Key? key,
    this.listMarbles,
    this.padding = 8,
    this.height = 60,
    this.width = double.infinity,
    this.backgroundColor = Colors.grey,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<WidgetBingo> createState() => _WidgetBingoState();
}

class _WidgetBingoState extends State<WidgetBingo>{
  double getSizeText(){
    return (widget.height - widget.padding * 2) / 2.8;;
  }
  double getDiameterMarble(){
    return widget.height - widget.padding * 2;
  }
  double getBorderRadius(){
    return widget.height/2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? getBorderRadius()),
      ),
      child: Padding(
        padding: EdgeInsets.all(widget.padding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? getBorderRadius()),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _listMarbles(getDiameterMarble()),
          ),
        ),
      ),
    );
  }

  _listMarbles(diameter) {
    return LiveList(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      reverse: true,
      itemCount: widget.listMarbles!.length,
      itemBuilder: (context, index, animation) {
        return FadeTransition(
          opacity: animation,
          alwaysIncludeSemantics: true,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-0.2, 0),
              end: Offset.zero,
            ).animate(animation),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: diameter/12),
              child: _marble(
                number: widget.listMarbles![index].number,
                backgroundColor: widget.listMarbles![index].color,
                diameter: diameter,
                sizeText: getSizeText(),
              ),
            ),
          ),
        );
      },
    );
  }
  
  Widget _marble({
      double diameter = 20, 
      int number = 0, 
      double sizeText = 12, 
      Color backgroundColor = Colors.amber,
      Color textColor = Colors.white,
      FontWeight fontWeight = FontWeight.bold,
      }) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: diameter / 2,
      child: Text(
        "$number",
        style: TextStyle(
          color: textColor,
          fontSize: sizeText,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
