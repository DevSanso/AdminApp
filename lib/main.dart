import 'package:flutter/material.dart';
import 'dart:async';
import './components/title.dart';
import './components/button_list.dart';
import 'components/login_area_component.dart';
import './components/component.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  static StreamController<int> _controller = StreamController();

  const MyApp({Key? key}) : super(key: key);
  
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin : Alignment.topCenter,
            end : Alignment.bottomCenter,
            colors: [
            Color.fromARGB(255, 255, 145, 145),
            Color.fromARGB(255, 231, 53, 53)
          ])
        ),
      child: SingleChildScrollView(child: mainPage()),),
    );
  }



  Widget mainPage() {
    return Column(
      children: [
        header(),
        section()
      ],
    );
  }
  Widget header() {
    return TitleComponent(Image.asset("assets/header.png")
    ,"Going TMessage","free,simple and fast chat service!");
  }
  Widget section() {
    return Container(
      margin: EdgeInsets.only(top:30),
      child: StreamBuilder(stream: _controller.stream,initialData: 0,builder :builderFunc),
    );
  }
  Widget builderFunc(BuildContext context,AsyncSnapshot<int> snapshot) {
    Component e;
    print("${snapshot.data}");
    switch(snapshot.data)
    {
      case 1:
        e = LoginAreaComponent();
        break;
      default:
        e = entry();
    }
    () async {
      _controller.add(await e.stream().first);
    }();
    return e;
  }

  Component entry() {
    return ButtonListComponent(const [
      RaisedButtonCotent(1, "sign up"),
      RaisedButtonCotent(2, "sign in")
    ]);
  }
}



