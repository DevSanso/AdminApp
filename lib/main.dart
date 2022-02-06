import 'package:flutter/material.dart';
import './components/title.dart';
import './components/button_list.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static Stream<int> event = Stream.value(0);
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
      child: StreamBuilder(stream: event,builder :builderFunc),
    );
  }
  Widget builderFunc(BuildContext context,AsyncSnapshot<int> snapshot) {

    

    var e = entry();
    event = e.stream();
    return e;
  }

  ButtonListComponent entry() {
    return ButtonListComponent(const [
      RaisedButtonCotent(1, "signup"),
      RaisedButtonCotent(2, "signin")
    ]);
  }
}



