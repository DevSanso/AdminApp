import 'dart:async';

import 'package:flutter/material.dart';



class RaisedButtonCotent {
  final int id;
  final String text;
  const RaisedButtonCotent(this.id,this.text);  
}

class ButtonListComponent extends StatelessWidget {
  final List<RaisedButtonCotent> btnContents;
  final StreamController<int> _controller = StreamController();
  late Stream<int> stream  = _controller.stream;

  ButtonListComponent(this.btnContents,{Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin : const EdgeInsets.only(top:20),
      child : Column(
        children: buttons()
        .map<Widget>((e) => Container(
          margin: const EdgeInsets.all(20),
          child : Material(type: MaterialType.transparency,child : e)
        ))
        .toList(),
      )
    );
  }
  Iterable<Widget> buttons() {
    return btnContents.map<Widget>(
      (e) => Container(
        width : 250,
        height: 50,
        child: ElevatedButton(
          child:Text(e.text,
            style: const TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 250, 132, 132)
          ),),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))
          ),
          onPressed: ()=> {_controller.add(e.id)},
        )
      )
    );
  }


}

/*
MaterialButton(child:Text(e.text,
        style: const TextStyle(
          fontSize: 24,
          color: Color.fromARGB(255, 250, 132, 132)
        ),
      ),
      onPressed: ()=> {
        _controller.add(e.id)
      },
      minWidth: 100,
      color: Colors.white,
    ));
*/