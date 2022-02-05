import 'package:flutter/material.dart';



class TitleComponent extends StatelessWidget {
  final Image image;
  final String title;
  final String hint;
  const TitleComponent(this.image,this.title,this.hint,{Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _imageWidget(),
      _nameWidget(),
      _hintWidget()
    ],);
  }

  Widget _imageWidget() {
    return Center(
      child: Container(
        margin : const EdgeInsets.only(top : 30),
        width : 200,
        height: 200,
        child :  FittedBox(fit: BoxFit.fill,child: image,)
      ),
    );
  }

  Widget _nameWidget() {
    var titleWord = title.split(" ");
    return Center(
      child : Container(
        margin: const EdgeInsets.only(top:20),
        child : Row(children: [
          Material(
            type: MaterialType.transparency,
            child : Text(
              titleWord[0] + " ",
              style : const TextStyle(
                fontSize: 42,
                fontFamily: "SupermercadoOne",
                color: Color.fromARGB(255, 255, 25, 25)
                )
            )
          ),
          Material(
            type: MaterialType.transparency,
            child : Text(
              titleWord[1],
              style : const TextStyle(
                fontSize: 36,
                fontFamily: "SupermercadoOne",
                color: Color.fromARGB(239, 255, 255, 255)
                )
            )
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        )
      )
    );
  }

  Widget _hintWidget() {
    return Center(
      child : Material(
        type : MaterialType.transparency,
        child : Text(hint,style: const TextStyle(color: Colors.white,fontSize: 12),)
      )
    );
  }
}


