import 'package:flutter/material.dart';
import 'package:flutter_bingo_balls/ui/bingo_lotery_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bingo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: _body(),
    );
  }//q onda cali gano boca
  _body(){
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BingoLoteryView(),
      ),
    );
  }
}
