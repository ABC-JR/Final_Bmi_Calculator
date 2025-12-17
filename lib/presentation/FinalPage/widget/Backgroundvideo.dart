import 'package:bmi_calculator/core/storage_thing.dart';
import 'package:bmi_calculator/presentation/AgePage/AgeScreen.dart';
import 'package:bmi_calculator/presentation/FinalPage/widget/LineFromGithub.dart';
import 'package:bmi_calculator/presentation/FinalPage/widget/WidgetContainer.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class BackgroundVideo extends StatefulWidget {
  final double bmi;
  final double bmr;

  const BackgroundVideo({super.key, required this.bmi, required this.bmr});

  @override
  State<BackgroundVideo> createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  late VideoPlayerController _controller;
  String whichis = "BMR";

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('lib/videos/heart4.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller
          ..setLooping(true)
          ..setVolume(0.0)
          ..play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const SizedBox();
    }

    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),

          Container(color: Colors.black.withOpacity(0.35)),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: WidgetContainer(
                        status: (widget.bmi >= 18.5 && widget.bmi <= 25)
                            ? "Normal"
                            : "Bad",

                        value: widget.bmi.toString(),
                        value_name: "BMI",
                      ),
                      onTap: () {
                        setState(() {
                          whichis = "BMI";
                        });
                      },
                    ),
                    SizedBox(),
                    GestureDetector(
                      child: WidgetContainer(
                        status: (widget.bmr >= 1200 && widget.bmr <= 2000)
                            ? "Normal"
                            : "Bad",

                        value: widget.bmr.toString(),
                        value_name: "BMR",
                      ),
                      onTap: () {
                        setState(() {
                          whichis = "BMR";
                        });
                      },
                    ),
                  ],
                ),
              ),
             
             
              Column(
                children: [
                  Center(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${whichis} analysis",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),

                          SizedBox(height: 220, child: LineChartSample3(whichis:whichis)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
