import 'package:bmi_calculator/presentation/AgePage/widget/BottomWidget.dart';
import 'package:bmi_calculator/presentation/AgePage/widget/TopTextsWidget.dart';

import 'package:flutter/material.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {


  
  int selectedAge = 18;
    

@override
Widget build(BuildContext context) {
  return SafeArea(
    child: 
    Scaffold(
      body:     
    Column(
      
      children: [
        const SizedBox(height: 20),

        TopTextsWidget(),

        const SizedBox(height: 20),

    
        Expanded(
          child: Center(
            child: getAgePicker(),
          ),
        ),

        const SizedBox(height: 20),

        BottomWidget(selectedAge: selectedAge),

        const SizedBox(height: 20),
      ],
    ),
  
      backgroundColor: Colors.white,
    )

  );
}

  Widget getAgePicker() {
    return Container(
      width: 200,
      height: 400,

      padding: const EdgeInsets.all(10),
      child: Column(
        children: [

       
      SizedBox(
        height: 200,
        child: ListWheelScrollView.useDelegate(
          physics: const FixedExtentScrollPhysics(),
          itemExtent: 45,
          perspective: 0.002,
          onSelectedItemChanged: (value) {
            setState(() {
              selectedAge = value;
            });
          },
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: 120,
            builder: (context, index) {
              final bool isSelected = index == selectedAge;

              return AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: isSelected ? 32 : 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                  color: isSelected ? Colors.black : Colors.black54,
                ),
                child: Center(child: Text("$index")),
              );
            },
          ),
        ),
      ),
       
       ],
      )
    );
  }
}

