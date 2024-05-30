import 'package:demo_pages/tictactoe/utils/colors.dart';
import 'package:flutter/material.dart';

//https://www.youtube.com/watch?v=ZWyeW6VWJC8
class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  bool xTurn = false;
  String? winner;
  int xScore = 0, oScore = 0;
  List<String> displayXO = List.filled(9, "");

  void turnIt(int index) {
    if (displayXO[index] == "") {
      displayXO[index] = xTurn ? "X" : "O";
      xTurn = !xTurn;
      winner = checkTheWinner(displayXO);
      if (winner != null) {
        _showDialog(winner);
      }
      if (winner == "X") xScore++;
      if (winner == "O") oScore++;
      setState(() {});
    }
  }

  String? checkTheWinner(List<String> list) {
    const List<List<int>> winnerCheck = [
      [0, 1, 2], //row1
      [3, 4, 5], //row2
      [6, 7, 8], //row3
      [0, 3, 6], //column1
      [1, 4, 7], //column2
      [2, 5, 8], //column3
      [0, 4, 8], //diagonal
      [2, 4, 6], //diagonal
    ];
    for (var combo in winnerCheck) {
      if (list[combo[0]] == list[combo[1]] &&
          list[combo[0]] == list[combo[2]] &&
          list[combo[0]].isNotEmpty) {
        return list[combo[0]];
      } else if (!list.contains("")) {
        return "Nobody";
      }
    }
    return null;
  }

  void _showDialog(String? winner) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "The winner is $winner",
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            content: const Text(":)"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    resetGame();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Restart",
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  onPressed: () {
                    resetGame();
                    xScore = 0;
                    oScore = 0;
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Finish",
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          );
        });
  }

  void resetGame() {
    setState(() {
      displayXO = ["", "", "", "", "", "", "", "", ""];
      winner = null;
      xTurn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pinkDiamond,
      appBar: AppBar(
        backgroundColor: violetHeaven,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  xTurn ? "Turn of X" : "Turn of O",
                  style: const TextStyle(color: purpleIllision, fontSize: 40),
                ),
              )),
          Expanded(
            flex: 6,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    childAspectRatio: 1),
                itemBuilder: (context, index) {
                  return GridItem(
                      turnIt: turnIt, index: index, xo: displayXO[index]);
                }),
          ),
          Expanded(
              flex: 2,
              child: winner != null
                  ? Text("X: $xScore  0: $oScore")
                  : const Text("going...")),
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.turnIt,
    required this.index,
    required this.xo,
  });
  final Function turnIt;
  final int index;
  final String xo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              blurRadius: 3,
              offset: Offset.infinite,
              color: iceCold,
              blurStyle: BlurStyle.solid)
        ],
        color: violetHeaven,
      ),
      child: IconButton(
          onPressed: () {
            (index < 9) ? turnIt(index) : null;
          },
          icon: Text(
            xo,
            style: const TextStyle(fontSize: 70, color: pinkDiamond),
          )),
    );
  }
}
