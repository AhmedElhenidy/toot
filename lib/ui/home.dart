import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:toot/statics/colors.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Colors.red,
        barBackgroundColor: Colors.blue,
        textColor: Colors.yellowAccent,
        inactiveIconColor: Colors.green,
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.search, title: "Search"),
          TabData(iconData: Icons.shopping_cart, title: "Basket")
        ],
        onTabChangedListener: (position) {
          setState(() {
            print(position);
            //currentPage = position;
          });
        },
      ),
      appBar: AppBar(
        title: Text("TOOT",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("توووت توت قطر صغنتووط",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: mainColor
            ),
          ),
        ),
      ),
    );
  }
}
