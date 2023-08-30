import 'package:flutter/material.dart';

class BoardState extends StatelessWidget {

  String title = '';
  Function onClicked;
  int index;
  BoardState(this.title,this.onClicked,this.index);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shadowColor: Colors.white,
          side: BorderSide(
            color:  Colors.white,
            width: 0.1,
          )
        ),
        onPressed: () {
          onClicked(index);
        },
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.w600,
            color: Colors.yellow,
          ),
        ),

      ),
    );
  }
}

class TextFieldCus extends StatelessWidget {

  var playerController = TextEditingController();
  String title;
  TextFieldCus(this.title,this.playerController);
  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: playerController,
      decoration: InputDecoration(
        label: Text(
          title,
          style: TextStyle(
            color: Colors.white54,
            fontSize: 15,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,

      ),
    );
  }
}

