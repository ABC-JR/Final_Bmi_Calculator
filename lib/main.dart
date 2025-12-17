import 'package:bmi_calculator/core/constant/storage_key.dart';
import 'package:bmi_calculator/core/storage_thing.dart';
import 'package:bmi_calculator/data/local/SharedPreference.dart';
import 'package:bmi_calculator/presentation/AgePage/AgeScreen.dart';
import 'package:bmi_calculator/presentation/Navigationpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final storage = SharedpreferenceStorage(prefs: prefs);
  StorageThing.storage = storage;

  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: (StorageThing.storage
            .getStringList(StorageKeys.bmi)
            ?.isNotEmpty ??
        false)
    ? NavigationScreen(
        bmi: double.tryParse(
                StorageThing.storage
                        .getStringList(StorageKeys.bmi)!
                        .last) ??
            0,
        bmr: double.tryParse(
                StorageThing.storage
                        .getStringList(StorageKeys.bmr)
                        ?.last ??
                    '0') ??
            0,
      )
    : AgeScreen(),


    );
  }
}
