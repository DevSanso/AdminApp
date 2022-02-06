import 'package:flutter/material.dart';
import 'dart:async';
import './component.dart';
import './muti_text_area.dart';


class SigninAreaComponent extends StatelessWidget implements Component {
  final StreamController<int> _controller = StreamController();
  @override
  Stream<int> stream()  => _controller.stream;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin : const EdgeInsets.only(top:40),
      child : Column(
        children: [
          Container(
            child: _textArea(),
            margin: const EdgeInsets.only(bottom: 20),
          ),
          _Check(),
          Container(
            margin: const EdgeInsets.only(top: 50,bottom: 60),
            child : _buttons()
          )
        ]
      ),
    );
  }

  Widget _textArea() {
    return const MutiTextAreaComponent("Login", ["Email","Password"]);
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


class _Check extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CheckState();
  }

}

class _CheckState extends State<_Check> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Checkbox(value: isCheck, onChanged: checkHandler),
          Container(
            margin : const EdgeInsets.only(right : 10),
            child : const Text("alway login",style: TextStyle(color: Colors.white),)
          )
        ],
      )
    );
  }
  void checkHandler(bool? val) {
    setState(() {
      isCheck = val!;
    });
  }
}