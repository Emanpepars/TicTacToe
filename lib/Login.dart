import 'package:flutter/material.dart';
import 'Button.dart';
import 'PlayerModel.dart';
import 'XOGame.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "Login";
  var playerOneController = TextEditingController();
  var playerTwoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFieldCus(
                  'First Player',
                playerOneController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldCus('Second Player',playerTwoController),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                onPressed: () {
                  var p = PlayerModel(playerOneController.text, playerTwoController.text);
                  Navigator.pushNamed(context, XOScreen.routeName , arguments: p );
                },
                child: const Text(
                  "Let's Goo",
                  style: TextStyle(
                      color: Colors.black,
                    fontWeight: FontWeight.w800
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
