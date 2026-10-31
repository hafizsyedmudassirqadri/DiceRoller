// import 'dart:math';
import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int leftDice = 1;
  int rightDice = 2;
  int score = 0;
  int turnsLeft = 30;

  final Random randomNum1 = Random();
  final Random randomNum2 = Random();

  void diceRoll() {
    if (turnsLeft <= 0) return;

    setState(() {
      leftDice = randomNum1.nextInt(6) + 1;
      rightDice = randomNum2.nextInt(6) + 1;

      if ((leftDice == 1 && rightDice == 1) ||
          (leftDice == 6 && rightDice == 6)) {
        score += 10;
      }
      turnsLeft--;
    });
  }

  void resetGame() {
    leftDice = 1;
    rightDice = 2;
    score = 0;
    turnsLeft = 30;
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Dice Roller App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent.withValues(alpha: 0.4),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: sh * 0.02,
            left: sw * 0.03,
            right: sw * 0.03,
            bottom: sh * 0.05,
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: sh * 0.04),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Score: $score",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: sh * 0.05),

              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Turns Left: $turnsLeft",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.only(
                  top: sh * 0.06,
                  right: sw * 0.04,
                  left: sw * 0.04,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/images/dice$leftDice.png",
                      height: sh * 0.17,
                    ),
                    SizedBox(height: sh * 0.05),
                    Image.asset(
                      "assets/images/dice$rightDice.png",
                      height: sh * 0.17,
                    ),
                  ],
                ),
              ),
              SizedBox(height: sh * 0.08),

              Container(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.1),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                      top: sh * 0.03,
                      bottom: sh * 0.03,
                      right: sw * 0.15,
                      left: sw * 0.15,
                    ),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: turnsLeft > 0 ? diceRoll : null,

                  child: Text(
                    "Roll",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: sh * 0.03),
              Container(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.1),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                      top: sh * 0.03,
                      bottom: sh * 0.03,
                      right: sw * 0.15,
                      left: sw * 0.15,
                    ),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    resetGame();
                    setState(() {});
                  },
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
