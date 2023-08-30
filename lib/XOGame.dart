import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'Button.dart';
import 'PlayerModel.dart';

class XOScreen extends StatefulWidget {
  static const String routeName = "XOScreen";

  const XOScreen({super.key});

  @override
  State<XOScreen> createState() => _XOScreenState();
}

class _XOScreenState extends State<XOScreen> {
  int player1sc = 0;
  int player2sc = 0;
  List<String> boardStateList = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as PlayerModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                resetGame();
                 player1sc = 0;
                 player2sc = 0;
              },
              icon: const Icon(Icons.refresh))
        ],
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${args.playerOne} o',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '$player1sc',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${args.playerTwo} x',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '$player2sc',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardState(boardStateList[0], onBtnClicked, 0),
                  BoardState(boardStateList[1], onBtnClicked, 1),
                  BoardState(boardStateList[2], onBtnClicked, 2),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardState(boardStateList[3], onBtnClicked, 3),
                  BoardState(boardStateList[4], onBtnClicked, 4),
                  BoardState(boardStateList[5], onBtnClicked, 5),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardState(boardStateList[6], onBtnClicked, 6),
                  BoardState(boardStateList[7], onBtnClicked, 7),
                  BoardState(boardStateList[8], onBtnClicked, 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int counter = 0;
  void onBtnClicked(index) {
    var args = ModalRoute.of(context)?.settings.arguments as PlayerModel;
    if (boardStateList[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      boardStateList[index] = "o";
      player1sc += 2;
      if (checkWinner("o")) {
        player1sc += 10;
        Dialogs.materialDialog(
          color: Colors.white,
          dialogWidth: kIsWeb ? 0.3 : null,
          context: context,
          actions: [
            Column(
              children: [
                // Add your image here
                Image.asset('assets/img/revenge.png',height: 200,),  // Adjust width and height as needed

                const SizedBox(height: 16),  // Add some spacing between image and text

                Text(
                  '${args.playerTwo} Do you wanna revenge ?',
                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w900),

                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconsButton(
                    onPressed: () {
                      resetGame();
                      Navigator.of(context).pop();
                    },
                    text: "Yuppp, Let's Go",
                    color: Colors.black,
                    textStyle: const TextStyle(color: Colors.white),
                    iconColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        );
        Dialogs.materialDialog(
          color: Colors.white,
            dialogWidth: kIsWeb ? 0.3 : null,
          context: context,
          actions: [
            Column(
              children: [
                // Add your image here
                Image.asset('assets/img/winner.png',height: 220,),  // Adjust width and height as needed

                const SizedBox(height: 16),  // Add some spacing between image and text

                Text(
                  '${args.playerOne} win',
                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w900),

                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconsButton(
                    onPressed: () {
                      resetGame();
                      Navigator.of(context).pop();
                    },
                    text: 'win again',
                    color: Colors.black,
                    textStyle: const TextStyle(color: Colors.white),
                    iconColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        );

        return;
      }
    } else {
      boardStateList[index] = "x";
      player2sc += 2;
      if (checkWinner("x")) {
        player2sc += 10;
        Dialogs.materialDialog(
          color: Colors.white,
          dialogWidth: kIsWeb ? 0.3 : null,
          context: context,
          actions: [
            Column(
              children: [
                // Add your image here
                Image.asset('assets/img/revenge.png',height: 200,),  // Adjust width and height as needed

                const SizedBox(height: 16),  // Add some spacing between image and text

                Text(
                  '${args.playerOne} Do you wanna revenge ?',
                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w900),

                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconsButton(
                    onPressed: () {
                      resetGame();
                      Navigator.of(context).pop();
                    },
                    text: "Yuppp, Let's Go",
                    color: Colors.black,
                    textStyle: const TextStyle(color: Colors.white),
                    iconColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        );
        Dialogs.materialDialog(
          color: Colors.white,
          dialogWidth: kIsWeb ? 0.3 : null,
          context: context,
          actions: [
            Column(
              children: [
                // Add your image here
                Image.asset('assets/img/winner.png',height: 220,),  // Adjust width and height as needed

                const SizedBox(height: 16),  // Add some spacing between image and text

                Text(
                  '${args.playerTwo} win',
                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w900),

                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconsButton(
                    onPressed: () {
                      resetGame();
                      Navigator.of(context).pop();
                    },
                    text: 'win again',
                    color: Colors.black,
                    textStyle: const TextStyle(color: Colors.white),
                    iconColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        );
        return;
      }
    }
    counter++;
    if (counter == 9) {
      Dialogs.materialDialog(
        color: Colors.white,
        dialogWidth: kIsWeb ? 0.3 : null,
        context: context,
        actions: [
          Column(
            children: [
              // Add your image here
              Image.asset('assets/img/nowinner.png',height: 200,),  // Adjust width and height as needed

              const SizedBox(height: 16),  // Add some spacing between image and text

              const Text(
                'no one win ',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900),

              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: IconsButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: "PLAY AGAIN",
                  color: Colors.black,
                  textStyle: const TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      );
      resetGame();
      player1sc = 0;
      player2sc = 0;
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    //Check Row
    for (int i = 0; i < 9; i += 3) {
      if (boardStateList[i] == symbol &&
          boardStateList[i + 1] == symbol &&
          boardStateList[i + 2] == symbol) {
        return true;
      }
    }

    //Check Column
    for (int i = 0; i < 3; i++) {
      if (boardStateList[i] == symbol &&
          boardStateList[i + 3] == symbol &&
          boardStateList[i + 6] == symbol) {
        return true;
      }
    }

    if (boardStateList[0] == symbol &&
        boardStateList[4] == symbol &&
        boardStateList[8] == symbol) {
      return true;
    }

    if (boardStateList[2] == symbol &&
        boardStateList[4] == symbol &&
        boardStateList[6] == symbol) {
      return true;
    }
    return false;
  }

  void resetGame() {
    boardStateList = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    counter = 0;
    setState(() {});
  }
}
