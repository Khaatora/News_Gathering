import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {

  Function onDrawerSelected;


  DrawerScreen(this.onDrawerSelected);
  static const int CATEGORIES=1;
  static const int SETTINGS=2;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          Container(
            color: Colors.green,
            padding :const EdgeInsets.symmetric(vertical: 30),
            child: const Text("News App!", textAlign: TextAlign.center, style: TextStyle(
              fontSize: 30, color: Colors.white,
            ),),
          ),
          InkWell(
            onTap: () {
              onDrawerSelected(CATEGORIES);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Categories", style: TextStyle(fontSize: 18),),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){
              onDrawerSelected(SETTINGS);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Settings", style: TextStyle(fontSize: 18),),
            ),
          ),
        ],
      ),
    );
  }
}
