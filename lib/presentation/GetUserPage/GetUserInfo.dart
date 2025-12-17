
import 'package:bmi_calculator/presentation/GetUserPage/widget/BottomPart.dart';
import 'package:bmi_calculator/presentation/MoreDetailPage/view/MoreDetailScreen.dart';
import 'package:flutter/material.dart';

class GetUserInfo extends StatefulWidget {
  final int age;

  const GetUserInfo({super.key, required this.age});

  @override
  State<GetUserInfo> createState() => _GetUserInfoState();
}

class _GetUserInfoState extends State<GetUserInfo> {
  // ___for gender
  List<String> listofgender = ['Male', 'Female', 'IDK'];
  List<IconData> listofgendericon = [
    Icons.male,
    Icons.female,
    Icons.sentiment_neutral_outlined,
  ];

  var valueindex_gender = 0;

  // ___for weight
  var valueindex_weght = 0.0;

  // for height
  var valueindex_height = 0.0;

  // for age
  var age = 0;
  @override
  void initState() {
    // TODO: implement initState
    age = widget.age;
    super.initState();
  }

  // color for all
  var value_color = Colors.blue;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 242, 242),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
       
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.all(5),
                  child: Text(
                    "Wealth Calculator",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                    textAlign: TextAlign.start,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          getGender(),
                          SizedBox(height: 20),
                          getRealWeght(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [SizedBox(height: 20), getheight()],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            BottomPart(valueindex_gender: valueindex_gender, valueindex_weght: valueindex_weght, valueindex_height: valueindex_height, value_color: value_color, age: age),
          ],
        ),
      ),
    );
  }

  Container getRealWeght() {
    return Container(
      decoration: decarationforeach(),
      child: Column(
        children: [
          Text(
            "WEIGHT [kg]",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 120, // 30–150 например
              itemBuilder: (_, index) {
                final value = index + 30;
                final isSelected = value == valueindex_weght;

                return GestureDetector(
                  onTap: () => setState(() {
                    valueindex_weght = value.toDouble();
                  }),
                  child: Container(
                    width: 60,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: isSelected ? value_color : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "$value",
                      style: TextStyle(
                        fontSize: isSelected ? 24 : 16,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container getheight() {
    return Container(
      height: 400,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
  
          Align(
            alignment: Alignment.bottomLeft,
            child: Icon(
              valueindex_gender == 0 ? Icons.man : Icons.woman,
              size: 200, 
              color: Colors.black.withOpacity(0.1), 
            ),
          ),

          Column(
            children: [
              SizedBox(height: 20),
              Text(
                "HEIGHT [cm]",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              SizedBox(
                height: 300,
                child: ListWheelScrollView.useDelegate(
                  physics: FixedExtentScrollPhysics(),
                  itemExtent: 40,
                  perspective: 0.002,
                  diameterRatio: 1.3,
                  onSelectedItemChanged: (value) {
                    setState(() {
                      valueindex_height = value + 120;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 160,
                    builder: (BuildContext context, int index) {
                      int value = index + 120;

                      final bool isSelected = value == valueindex_height;

                      return AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 150),
                        style: TextStyle(
                          fontSize: isSelected ? 32 : 14,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isSelected
                              ? Colors.black
                              : Colors.black.withOpacity(0.35),
                        ),
                        child: Text("$value"),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container getGender() {
    return Container(
      height: 200,
      width: 200,
      decoration: decarationforeach(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("GENDER "),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                listofgendericon[0],
                color: valueindex_gender == 0 ? Colors.blue : Colors.grey,
              ),
              SizedBox(width: 30),
              Icon(
                listofgendericon[1],
                color: valueindex_gender == 1
                    ? const Color.fromARGB(255, 236, 71, 59)
                    : Colors.grey,
              ),
              SizedBox(width: 30),
              Icon(
                listofgendericon[2],

                color: valueindex_gender == 2 ? Colors.amber : Colors.grey,
              ),
            ],
          ),
          Center(
            child: Slider(
              activeColor: value_color,
              min: 0,
              max: 2,
              divisions: 2,
              value: valueindex_gender.toDouble(),
              onChanged: (v) {
                setState(() {
                  valueindex_gender = v.toInt();
                  value_color = v == 0
                      ? Colors.blue
                      : v == 1
                      ? Colors.red
                      : Colors.grey;
                });
              },
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  BoxDecoration decarationforeach() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
    );
  }
}
