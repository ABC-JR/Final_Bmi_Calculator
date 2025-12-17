import 'package:bmi_calculator/core/constant/storage_key.dart';
import 'package:bmi_calculator/core/storage_thing.dart';
import 'package:bmi_calculator/presentation/model/RecommendationResult.dart';
import 'package:flutter/material.dart';

class JustWidget extends StatelessWidget {
  const JustWidget({
    super.key,
    required this.controller,
    required this.scoreAnimation,
    required this.sizeAnimation,
    required this.color,
    required this.value_num,
    required this.gender,
    required this.pagecontroller,
    required this.state,
  });

  final AnimationController controller;
  final Animation<double> scoreAnimation;
  final Animation<double> sizeAnimation;
  final MaterialColor color;
  final dynamic value_num;
  final int gender;
  final PageController pagecontroller;
  final String state;

  @override
  Widget build(BuildContext context) {
    final recommendation = getRecommendation(
      state,
      value_num.toDouble(),
      gender,
    );

    addtoAdvice(recommendation.advice);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    state == "Main" ? "Your Health Score" : state,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),

                  AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) {
                      return Text(
                        state == "Main"
                            ? scoreAnimation.value.toStringAsFixed(1)
                            : value_num.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: sizeAnimation.value,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 10),
                  Text(
                    state == "Main"
                        ? "Based on BMI & body parameters"
                        : "$state parameters",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state == "Main"
                        ? "Your body score = ${value_num.toStringAsFixed(1)}"
                        : "Your $state score = ${value_num.toStringAsFixed(1)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    _normalRangeText(state),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),

                  const Divider(height: 30),

                  recommendation.widget,

                  const SizedBox(height: 15),

                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        pagecontroller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: Icon(
                        Icons.arrow_circle_right_outlined,
                        color: gender == 0 ? Colors.blue : Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _normalRangeText(String state) {
    switch (state) {
      case "Main":
        return "Normal range 69.5 – 128.9";
      case "BMI":
        return "Normal range 18.5 – 24.9";
      case "BMR":
        return "Normal range 1200 – 2000";
      case "BODY FAT":
        return "Normal range:\nMen 10–20%\nWomen 18–28%";
      case "WATER DAY":
        return "Normal range 2 – 2.5 L";
      default:
        return "";
    }
  }

  addtoAdvice(String value) async {
    await StorageThing.storage.addToString(StorageKeys.advice, value);
  }

  RecommendationResult getRecommendation(
    String state,
    double value,
    int gender,
  ) {
    String advice = "";
    Widget content;

    switch (state) {
      case "Main":
      case "BMI":
        if (value < 18.5) {
          advice =
              "Increase daily calorie intake\n"
              "Eat regularly (3–4 meals per day)\n"
              "Add more protein and healthy fats\n"
              "Avoid skipping meals";

          content = _recommendationBlock(
            meaning: "Underweight\nPossible lack of energy and nutrients",
            advice: advice,
          );
        } else if (value >= 25) {
          advice =
              "Reduce sugary and fatty foods\n"
              "Control portion sizes\n"
              "Increase daily physical activity\n"
              "Maintain regular sleep";

          content = _recommendationBlock(
            meaning:
                "Overweight or obesity\nIncreased strain on heart and joints",
            advice: advice,
          );
        } else {
          advice = "Your body is in a healthy range";
          content = _perfectBody();
        }
        break;

      case "BMR":
        if (value < 1200) {
          advice =
              "Avoid extreme dieting\n"
              "Eat enough protein\n"
              "Improve sleep quality\n"
              "Maintain regular meals";

          content = _recommendationBlock(
            meaning: "Slow metabolism\nPossible fatigue and low energy",
            advice: advice,
          );
        } else if (value >= 2000) {
          advice =
              "Ensure adequate calorie intake\n"
              "Do not skip meals\n"
              "Stay well hydrated";

          content = _recommendationBlock(
            meaning:
                "High energy expenditure\nOften seen in active individuals",
            advice: advice,
          );
        } else {
          advice = "Metabolism level is normal";
          content = _perfectBody();
        }
        break;

      case "BODY FAT":
        if ((gender == 0 && value < 10) || (gender == 1 && value < 18)) {
          advice =
              "Increase calorie intake\n"
              "Add healthy fats\n"
              "Reduce excessive training";

          content = _recommendationBlock(
            meaning: "Hormonal imbalance risk\nLower immune function",
            advice: advice,
          );
        } else if ((gender == 0 && value >= 20) ||
            (gender == 1 && value >= 28)) {
          advice =
              "Increase physical activity\n"
              "Improve diet quality\n"
              "Reduce sugar and fast food";

          content = _recommendationBlock(
            meaning: "Increased cardiovascular risk\nReduced endurance",
            advice: advice,
          );
        } else {
          advice = "Body fat percentage is healthy";
          content = _perfectBody();
        }
        break;

      case "IDEAL WEIGHT":
        advice =
            "Focus on long-term health\n"
            "Do not compare yourself to others";

        content = _recommendationBlock(
          meaning: "Your weight is within the optimal range",
          advice: advice,
        );
        break;

      case "WATER DAY":
        if (value < 2000) {
          advice =
              "Drink water regularly\n"
              "Do not wait until you feel thirsty";

          content = _recommendationBlock(
            meaning: "Dehydration risk\nFatigue and headaches",
            advice: advice,
          );
        } else if (value >= 2500) {
          advice =
              "Drink evenly throughout the day\n"
              "Avoid excessive forced intake";

          content = _recommendationBlock(
            meaning: "Increased strain on kidneys",
            advice: advice,
          );
        } else {
          advice = "Daily water intake is optimal";
          content = _perfectBody();
        }
        break;

      default:
        advice = "No recommendation available";
        content = const Text("No data available");
    }

    return RecommendationResult(content, advice);
  }

  Widget _recommendationBlock({
    required String meaning,
    required String advice,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "What it means:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(meaning, style: const TextStyle(fontSize: 18, color: Colors.grey)),
        const SizedBox(height: 10),
        const Text(
          "Doctor’s recommendation:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(advice, style: const TextStyle(fontSize: 18, color: Colors.grey)),
      ],
    );
  }

  Widget _perfectBody() {
    return const Text(
      "Your body is in perfect condition 👌",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.green,
      ),
    );
  }
}
