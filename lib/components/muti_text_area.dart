import 'package:flutter/material.dart';

class MutiTextAreaComponent extends StatelessWidget{
  final String title;
  final List<String> txts;
  const MutiTextAreaComponent(this.title,this.txts,{Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _section(),
    );
  }
  List<Widget> _section() {
    var section = <Widget>[
      Material(
        type: MaterialType.transparency,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white,fontSize: 28),
        )
      )
    ];
    section.addAll(
      _textAreas().map((e) => Container(
        margin: const EdgeInsets.all(10),
        child : Material(child: e,type: MaterialType.transparency,)
      ))
    );
    return section;
  }
  Iterable<Widget> _textAreas() {
    return txts.map((txt)=> _textArea(txt));
  }



  
}

Widget _textArea(String txt) {
  return TextField(
    obscureText: true,
    decoration: InputDecoration(
    labelStyle: const TextStyle(
      color: Colors.white),
      border: const UnderlineInputBorder(),
      labelText: txt,
    ),
  );
}