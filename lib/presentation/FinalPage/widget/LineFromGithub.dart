import 'package:bmi_calculator/core/constant/storage_key.dart';
import 'package:bmi_calculator/core/storage_thing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample3 extends StatefulWidget {
  String whichis;
  LineChartSample3({super.key , required this.whichis});

  @override
  State<LineChartSample3> createState() => _LineChartSample3State();
}

class _LineChartSample3State extends State<LineChartSample3> {


  @override
  void initState() {
    super.initState();

  
  }

  @override
  Widget build(BuildContext context) {
      List<String> bmiValues = widget.whichis == "BMI"
    ? (StorageThing.storage.getStringList(StorageKeys.bmi) ?? [])
    : widget.whichis == "BMR"
        ? (StorageThing.storage.getStringList(StorageKeys.bmr) ?? [])
        : ["15", "18", "21"];


    
     List<String> timeValues  =
        StorageThing.storage.getStringList(StorageKeys.time) ??
         ["15:21" , "18:25" , "21:52"];


         
    if (bmiValues.isEmpty || timeValues.isEmpty) {
      return const Center(child: Text('No data'));
    }

    /// 🟢 Конвертация String → FlSpot
    final spots = <FlSpot>[];

    for (int i = 0; i < bmiValues.length && i < timeValues.length; i++) {
      final y = double.tryParse(bmiValues[i]);

      if (y == null || !y.isFinite) continue;

      spots.add(FlSpot(i.toDouble(), y));
    }

    if (spots.isEmpty) {
      return const Center(child: Text('Invalid data'));
    }

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: (spots.length - 1).toDouble(),
        minY: 0,

        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            barWidth: 3,
            color: Colors.red,
            dotData: FlDotData(show: true),
          ),
        ],

        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),

    
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 5, // 🔥 ОБЯЗАТЕЛЬНО
              getTitlesWidget: (value, meta) {
                if (!value.isFinite) return const SizedBox.shrink();
                return Text(value.toStringAsFixed(0));
              },
            ),
          ),

  
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 2, // 🔥 ОБЯЗАТЕЛЬНО
              getTitlesWidget: (value, meta) {
                if (!value.isFinite) {
                  return const SizedBox.shrink();
                }

                final index = value.toInt();
                if (index < 0 || index >= timeValues.length) {
                  return const SizedBox.shrink();
                }

                final date = DateTime.tryParse(timeValues[index]);
                if (date == null) {
                  return const SizedBox.shrink();
                }

                return Text(
                  '${date.day}/${date.month}',
                  style: const TextStyle(fontSize: 10),
                );
              },
            ),
          ),
        ),

        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: true),
      ),
    );
  }
}
