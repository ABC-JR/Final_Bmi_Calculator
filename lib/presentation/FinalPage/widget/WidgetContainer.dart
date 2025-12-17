import 'package:flutter/material.dart';


class WidgetContainer extends StatelessWidget {
  final String value_name;
  final String value;
  final String status;

   WidgetContainer({
       required this.value_name  ,
    required this.value ,
    required this.status ,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  [
            Text(
              "${value_name} analysys",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
    
            SizedBox(height: 12),
    
            Text(
              "${value_name}",
              style: TextStyle(color: Colors.white70),
            ),
            Text(
              "${double.parse(value).toStringAsFixed(2)}",
              style: TextStyle(
                color: status == "Normal" ? Colors.greenAccent : Colors.red,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
    
            SizedBox(height: 8),
    
            Text(

              "Status: ${status}",
              style: TextStyle(
                color: status == "Normal" ? Colors.greenAccent : Colors.red,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
