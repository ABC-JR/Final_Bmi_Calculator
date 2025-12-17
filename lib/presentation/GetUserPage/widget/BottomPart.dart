import 'package:bmi_calculator/presentation/MoreDetailPage/view/MoreDetailScreen.dart';
import 'package:flutter/material.dart';
class BottomPart extends StatelessWidget {
  const BottomPart({
    super.key,
    required this.valueindex_gender,
    required this.valueindex_weght,
    required this.valueindex_height,
    required this.value_color,
    required this.age,
  });

  final int valueindex_gender;
  final double valueindex_weght;
  final double valueindex_height;
  final MaterialColor value_color;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(context, 
              MaterialPageRoute(builder:(context) =>
              MoreDetailScreen(gender: valueindex_gender, 
              weight: valueindex_weght.toInt(), 
              height: valueindex_height.toInt(), 
              color: value_color, 
              age: age)
              )
            );
          },
          child: Text(
            'Continue',
            style: TextStyle(fontSize: 18, color: value_color),
          ),
        ),
      ),
    );
  }
}
