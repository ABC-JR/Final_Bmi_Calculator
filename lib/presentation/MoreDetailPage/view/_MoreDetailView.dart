import 'package:bmi_calculator/core/constant/storage_key.dart';
import 'package:bmi_calculator/core/storage_thing.dart';
import 'package:bmi_calculator/presentation/FinalPage/FinalPage.dart';
import 'package:bmi_calculator/presentation/MoreDetailPage/bloc/moredetail_bloc.dart';
import 'package:bmi_calculator/presentation/MoreDetailPage/bloc/moredetail_state.dart';
import 'package:bmi_calculator/presentation/MoreDetailPage/widget/JustWidget.dart';
import 'package:bmi_calculator/presentation/Navigationpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreDetailView extends StatefulWidget {
  const MoreDetailView();

  @override
  State<MoreDetailView> createState() => _MoreDetailViewState();
}

class _MoreDetailViewState extends State<MoreDetailView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  var states;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();

    StorageThing.storage.remove(StorageKeys.advice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NavigationScreen(bmi: states.bmi, bmr: states.bmr),
                ),
              );
            },
            icon: Icon(Icons.bar_chart_sharp, color: Colors.blue),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<MoredetailBloc, MoredetailBlocState>(
        builder: (context, state) {
          states = state;
          bool _saved = false;

          if (state is MoredetailState_Loaded && !_saved) {
            _saved = true;

            StorageThing.storage.addToStringList(
              StorageKeys.bmi,
              state.bmi.toString(),
            );

             StorageThing.storage.addToStringList(
              StorageKeys.bmr,
              state.bmr.toString(),
            );
            var raw = DateTime.now().toIso8601String();
            final dateTime = DateTime.parse(raw);

            final date = "${dateTime.month}/${dateTime.day}";
            final time =
                "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";

            StorageThing.storage.addToStringList(
              StorageKeys.time,
              "${date}\n${time}"
            );



            


            
          }

          if (state is MoredetailState_Loaded) {
 
            var scoreAnimation = Tween<double>(begin: 0, end: state.valueNum)
                .animate(
                  CurvedAnimation(parent: controller, curve: Curves.easeOut),
                );
            var sizeAnimation = Tween<double>(begin: 10, end: state.valueNum)
                .animate(
                  CurvedAnimation(
                    parent: controller,
                    curve: Curves.easeOutBack,
                  ),
                );
            var pagecontroller = PageController();

            return PageView(
              controller: pagecontroller,
              children: [
                JustWidget(
                  controller: controller,
                  value_num: state.valueNum,
                  color: state.color,
                  gender: state.gender,
                  scoreAnimation: scoreAnimation,
                  sizeAnimation: sizeAnimation,
                  pagecontroller: pagecontroller,
                  state: "Main",
                ),
                JustWidget(
                  controller: controller,
                  value_num: state.bmi,
                  color: state.color,
                  gender: state.gender,
                  scoreAnimation: scoreAnimation,
                  sizeAnimation: sizeAnimation,
                  pagecontroller: pagecontroller,
                  state: "BMI",
                ),
                JustWidget(
                  controller: controller,
                  value_num: state.bmr,
                  color: state.color,
                  gender: state.gender,
                  scoreAnimation: scoreAnimation,
                  sizeAnimation: sizeAnimation,
                  pagecontroller: pagecontroller,
                  state: "BMR",
                ),
                JustWidget(
                  controller: controller,
                  value_num: state.bodyFat,
                  color: state.color,
                  gender: state.gender,
                  scoreAnimation: scoreAnimation,
                  sizeAnimation: sizeAnimation,
                  pagecontroller: pagecontroller,
                  state: "BODY FAT",
                ),

                JustWidget(
                  controller: controller,
                  value_num: state.idealWeight,
                  color: state.color,
                  gender: state.gender,
                  scoreAnimation: scoreAnimation,
                  sizeAnimation: sizeAnimation,
                  pagecontroller: pagecontroller,
                  state: "IDEAL WEIGHT",
                ),
                JustWidget(
                  controller: controller,
                  value_num: state.waterDay,
                  color: state.color,
                  gender: state.gender,
                  scoreAnimation: scoreAnimation,
                  sizeAnimation: sizeAnimation,
                  pagecontroller: pagecontroller,
                  state: "WATER DAY",
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
