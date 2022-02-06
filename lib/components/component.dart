import 'package:flutter/material.dart';



abstract class Component implements Widget {
  Stream<int> stream();
}