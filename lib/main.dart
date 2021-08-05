import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Dicee"),
        ),
        body: DicePage(),
      ),
    );
  }
}



class DicePage extends StatefulWidget {

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 2;

  rollDice(bool isLeft, int diceNum){
    setState(() {
      if (isLeft == true){
        this.leftDiceNum = diceNum;
      }
      else{
        this.rightDiceNum = diceNum;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Dice(imageNum: leftDiceNum, rollDice: rollDice, isLeft: true,),
          Dice(imageNum: rightDiceNum, rollDice: rollDice, isLeft: false),
        ],
      ),
    );
  }
}

class Dice extends StatelessWidget{
  late final int imageNum;
  late final Function rollDice;
  late final bool isLeft;

  int generateRandomNumber(){
    return Random().nextInt(6)+1;
  }

  Dice({required this.imageNum, required this.rollDice, required this.isLeft});
  @override
  Widget build(BuildContext context){
    return Expanded(
      child: TextButton(
      child: Image.asset("assets/images/dice$imageNum.png"),
      onPressed: (){rollDice(isLeft, generateRandomNumber());},
    ),
    );
  }
}
