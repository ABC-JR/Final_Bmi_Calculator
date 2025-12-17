
import 'package:bmi_calculator/presentation/FinalPage/widget/Backgroundvideo.dart';
import 'package:flutter/material.dart';


class FinalScreen extends StatefulWidget {
   final double bmi;
  final double bmr;

  FinalScreen(
    {
      super.key ,
      required this.bmi ,
      required this.bmr , 
    }
  );


  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundVideo(
              bmi: widget.bmi,
              bmr: widget.bmr,
          ),
    );
  }
}
