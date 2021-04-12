import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String playerO = "O";
  String playerX = "X";
  bool playerTurn = true;
  List<String> displaySomething = ["", "", "", "", "", "", "", "", ""];
  int scoreO = 0;
  int scoreX = 0;
  int failedBoxes = 0;

  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));

  @override
  Widget build(BuildContext context) {
    var _styledText = TextStyle(fontSize: 20, color: Colors.white);

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, left: 10.0),
                    child: Column(
                      children: [
                        Text(
                          "Player O",
                          style: myNewFontWhite,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            scoreO.toString(),
                            style: myNewFontWhite,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, left: 30.0),
                    child: Column(
                      children: [
                        Text(
                          "Player X",
                          style: myNewFontWhite,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            scoreX.toString(),
                            style: myNewFontWhite,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[700])),
                      child: Center(
                        child: Text(
                          displaySomething[index],
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Text("TIC TAC TOE", style: myNewFontWhite),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                          child: InkWell(onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => IntroScreen()),
                            );
                          },child: Icon(Icons.arrow_back, color: Colors.white,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () {
                            _clearBoard();
                          },
                          child: Text("ClearBoard"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          child: Text('New Game'),
                          onPressed: () async {
                            if (await confirm(
                              context,
                              title: Text('TIC TAC TOE'),
                              content: Text('Would you like to Play New Game?'),
                              textOK: Text('Yes'),
                              textCancel: Text('No'),
                            )) {
                              _newGame();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (playerTurn && displaySomething[index] == "") {
        displaySomething[index] = "$playerO";
        failedBoxes += 1;
        playerTurn = false;
      } else if (!playerTurn && displaySomething[index] == "") {
        displaySomething[index] = "$playerX";
        failedBoxes += 1;
        playerTurn = true;
      }

      _checkWinner();
    });
  }

  void _checkWinner() {
    // Checking 1st row
    if (displaySomething[0] == displaySomething[1] &&
        displaySomething[1] == displaySomething[2] &&
        displaySomething[0] != "") {
      _showDialogBox(displaySomething[0]);
    }
    // Checking 2nd row
    else if (displaySomething[3] == displaySomething[4] &&
        displaySomething[4] == displaySomething[5] &&
        displaySomething[3] != "") {
      _showDialogBox(displaySomething[3]);
    }
    // Checking 3rd row
    else if (displaySomething[6] == displaySomething[7] &&
        displaySomething[7] == displaySomething[8] &&
        displaySomething[6] != "") {
      _showDialogBox(displaySomething[6]);
    }
    // Checking 1st column
    else if (displaySomething[0] == displaySomething[3] &&
        displaySomething[3] == displaySomething[6] &&
        displaySomething[0] != "") {
      _showDialogBox(displaySomething[0]);
    }
    // Checking 2nd column
    else if (displaySomething[1] == displaySomething[4] &&
        displaySomething[4] == displaySomething[7] &&
        displaySomething[1] != "") {
      _showDialogBox(displaySomething[1]);
    }
    // Checking 3rd column
    else if (displaySomething[2] == displaySomething[5] &&
        displaySomething[5] == displaySomething[8] &&
        displaySomething[2] != "") {
      _showDialogBox(displaySomething[2]);
    }
    // Checking 1rd diagonal
    else if (displaySomething[0] == displaySomething[4] &&
        displaySomething[4] == displaySomething[8] &&
        displaySomething[0] != "") {
      _showDialogBox(displaySomething[0]);
    }
    // Checking 2nd diagonal
    else if (displaySomething[2] == displaySomething[4] &&
        displaySomething[4] == displaySomething[6] &&
        displaySomething[2] != "") {
      _showDialogBox(displaySomething[2]);
    }

    // Check if draw

    else if (failedBoxes == 9) {
      _drawDialogBox();
    }
  }

  void _showDialogBox(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Winner is : " + winner),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: Text("Play Again"))
            ],
          );
        });

    if (winner == "O") {
      scoreO += 1;
    } else if (winner == "X")
      setState(() {
        scoreX += 1;
      });
  }

  void _drawDialogBox() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("DRAW"),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: Text("Play Again"))
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displaySomething[i] = "";
      }
    });

    failedBoxes = 0;
  }

  void _newGame() {
    _clearBoard();
    scoreO = 0;
    scoreX = 0;
  }
}
