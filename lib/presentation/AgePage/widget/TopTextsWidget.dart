import 'package:flutter/material.dart';
class TopTextsWidget extends StatelessWidget {
  const TopTextsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Your age",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "We use it to calculate BMI",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
