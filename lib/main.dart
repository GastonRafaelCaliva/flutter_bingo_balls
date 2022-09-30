import 'package:flutter/material.dart';
import 'package:flutter_bingo_balls/ui/bingo_lotery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: BingoLotery().id,
      routes: {
        BingoLotery().id: (_) =>  BingoLotery(),
      },
    );
  }
}
