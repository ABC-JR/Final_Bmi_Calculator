import 'package:flutter/material.dart';

abstract class MoredetailBlocState{}





class MoredetailState_Loading extends MoredetailBlocState {}



class MoredetailState_Loaded extends MoredetailBlocState {
  final double bmi;
  final double bmr;
  final double idealWeight;
  final double bodyFat;
  final double waterDay;
  final double valueNum;
  final int gender;
  final MaterialColor color;

    MoredetailState_Loaded({
    required this.bmi,
    required this.bmr,
    required this.idealWeight,
    required this.bodyFat,
    required this.waterDay,
    required this.valueNum,
    required this.gender,
    required this.color,
  });
}