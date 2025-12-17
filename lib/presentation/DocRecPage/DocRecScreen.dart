import 'package:bmi_calculator/core/constant/storage_key.dart';
import 'package:bmi_calculator/core/storage_thing.dart';
import 'package:bmi_calculator/presentation/DocRecPage/widget/AdvisePart.dart';
import 'package:bmi_calculator/presentation/DocRecPage/widget/DoctorCard.dart';
import 'package:flutter/material.dart';

class DocRecScreen extends StatefulWidget {
  const DocRecScreen({super.key});

  @override
  State<DocRecScreen> createState() => _DocRecScreenState();
}

class _DocRecScreenState extends State<DocRecScreen> {
  @override
  Widget build(BuildContext context) {
    final advice =
        StorageThing.storage.getString(StorageKeys.advice) ?? "No advice yet";

    final List<String> tips = advice.split('\n');

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff0f2027), Color(0xff203a43), Color(0xff2c5364)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),

              DoctorCard(),

              const SizedBox(height: 30),


              AdvisePart(tips: tips),
            ],
          ),
        ),
      ),
    );
  }
}
