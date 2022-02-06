import 'package:flutter/material.dart';
import 'dart:async';

import './component.dart';
import './muti_text_area.dart';

class SignupAreaComponent extends StatelessWidget implements Component{
  final StreamController<int> _controller = StreamController();
  @override
  Stream<int> stream()  => _controller.stream;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin : const EdgeInsets.only(top:40),
      child : Column(
        children: _section(),
      ),
    );
  }
  List<Widget> _section() {
    var section = <Widget>[
      Container(
        margin: const EdgeInsets.only(top:30),
        child : const MutiTextAreaComponent(
          "Create Account",
          ["Email","Password","PreEnter Password"])
        )
    ];
   
    section.add(
      Container(
        margin: const EdgeInsets.only(top: 50,bottom: 60),
        child : _buttons()
      )
    );
    return section;
  }


  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(child: _cancelBtnChild(),onPressed: ()=>{_controller.add(0)},),
        
        Container(
          margin: const EdgeInsets.only(left: 20),
          width: 180,
          child : _loginBtnChild()
        )
      ],
    );
  }

  
}

Text _cancelBtnChild() {
  return const Text(
    "Cancel",
    style: TextStyle(
      color: Colors.white,
      fontSize: 18
    ),
  );
}

Widget _loginBtnChild() {
  return ElevatedButton(
    child:const Text("Login",
      style: TextStyle(
      fontSize: 24,
      color: Color.fromARGB(255, 250, 132, 132)
    ),),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ))
    ),
    onPressed: ()=> {},
  );
}