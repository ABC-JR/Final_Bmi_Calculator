import 'package:bmi_calculator/presentation/MoreDetailPage/bloc/moredetail_bloc.dart';
import 'package:bmi_calculator/presentation/MoreDetailPage/bloc/moredetail_event.dart';
import 'package:bmi_calculator/presentation/MoreDetailPage/view/_MoreDetailView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreDetailScreen extends StatelessWidget {
  final int gender;
  final int weight;
  final int height;
  final int age;
  final MaterialColor color;

  const MoreDetailScreen({
    super.key,
    required this.gender,
    required this.weight,
    required this.height,
    required this.age,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      
      create: (_) => MoredetailBloc()
        ..add(
          MoredetailEvent_Loading(
            age: age,
            gender: gender,
            weight: weight,
            height: height,
            value_color: color,
          ),
        ),
      child:  MoreDetailView()
    );
  }
}
