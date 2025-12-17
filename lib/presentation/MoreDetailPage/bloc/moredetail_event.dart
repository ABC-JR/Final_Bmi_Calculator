import 'package:flutter/material.dart';

abstract class MoredetailBlocEvent{

}




class MoredetailEvent_Loading extends MoredetailBlocEvent {
   final int gender;
  final int weight;
  final int height;
  final int age;
  final MaterialColor value_color;

   MoredetailEvent_Loading({
    required this.gender,
    required this.weight,
    required this.height,
    required this.value_color,
    required this.age,
  });
}

