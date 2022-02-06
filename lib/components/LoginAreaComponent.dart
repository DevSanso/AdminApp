import 'package:flutter/material.dart';
import 'dart:async';

import './component.dart';

class LoginAreaComponent extends StatelessWidget implements Component{
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
      const Material(
        type: MaterialType.transparency,
        child: Text(
          "Create Account",
          style: TextStyle(color: Colors.white,fontSize: 28),
        )
      )
    ];
    section.addAll(
      _textAreas().map((e) => Container(
        margin: const EdgeInsets.all(10),
        child : Material(child: e,type: MaterialType.transparency,)
      ))
    );
    section.add(
      Container(
        margin: const EdgeInsets.only(top: 50,bottom: 60),
        child : _buttons()
      )
    );
    return section;
  }
  List<Widget> _textAreas() {
    return [
      const TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          border: UnderlineInputBorder(),
          labelText: 'Email',
        ),
      ),
      const TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          border: UnderlineInputBorder(),
          labelText: 'Password',
        ),
      ),
      const TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          border: UnderlineInputBorder(),
          labelText: 'PreEnter Password',
        ),
      )
    ];
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