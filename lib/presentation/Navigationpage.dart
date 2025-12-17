
import 'package:bmi_calculator/presentation/AgePage/AgeScreen.dart';
import 'package:bmi_calculator/presentation/DocRecPage/DocRecScreen.dart';
import 'package:bmi_calculator/presentation/FinalPage/FinalPage.dart';
import 'package:flutter/material.dart';
class NavigationScreen extends StatefulWidget {
  final double bmi;
  final double bmr;

   NavigationScreen({super.key  , 
   
     required this.bmi ,
    required this.bmr , 
   
   });

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  late final List<Widget> _pages;



  @override
  void initState() {
  _pages =  [
      FinalScreen(bmi: widget.bmi, bmr: widget.bmr) , 
      AgeScreen() , 
      DocRecScreen()


  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.transparent,

        items: const [
 
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restore),
            label: 'Retest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tips_and_updates_outlined),
            label: 'Recommendation',
          ),
        ],
      ),
    );
  }
}
