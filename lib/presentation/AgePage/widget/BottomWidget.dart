
import 'package:bmi_calculator/presentation/GetUserPage/GetUserInfo.dart';
import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
    required this.selectedAge,
  });

  final int selectedAge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          onPressed: () {
            Navigator.push
            (
              context , 
              MaterialPageRoute(
                builder:(context)  => GetUserInfo(age: selectedAge,) 
    
              ) 
            );
          },
          child: const Text(
            'Continue',
            style: TextStyle(fontSize: 18 , color: Colors.black),
          ),
        ),
      ),
    );
  }
}
