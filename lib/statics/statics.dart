import 'package:flutter/material.dart';
import 'colors.dart';
String hostName ="http://www.egymuseums.somee.com";
Widget bottomBar(Size size,int selected) {
  return Container(
    height: 100,
    child: Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: Container(
            width: size.width,
            color: mainColor,
            height: 65,
            child:BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: 2,
              backgroundColor: mainColor,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(selected==BottomNavigationItems.MUSEUMS?"images/museum100.png":"images/museum40.png",width: 30,height: 30,),
                  title: Text("Museums",
                    style: TextStyle(
                        color: selected==BottomNavigationItems.MUSEUMS?Colors.white: Colors.white.withOpacity(0.5),
                        fontSize: 16
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(selected==BottomNavigationItems.MONUMENT?"images/giza100.png":"images/giza40.png",width: 30,height: 35,),
                  title: Text("Monuments",
                    style: TextStyle(
                      color:selected==BottomNavigationItems.MONUMENT?Colors.white: Colors.white.withOpacity(0.5),
                      fontSize: 14,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                    icon: Container(height: 30,),
                    title: Container()
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(selected==BottomNavigationItems.RECOMMENDED?"images/badge100.png":"images/badge40.png",width: 30,height: 30,),
                  title: Text("Recommended",
                    style: TextStyle(
                      color: selected==BottomNavigationItems.RECOMMENDED?Colors.white:Colors.white.withOpacity(0.5),
                      fontSize: 14,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(selected==BottomNavigationItems.GIFTS?"images/gift100.png":"images/gift40.png",width: 30,height: 30,),
                  title: Text("gifts",
                    style: TextStyle(
                      color: selected==BottomNavigationItems.GIFTS?Colors.white:Colors.white.withOpacity(0.5),
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: size.width/2-35,
          right: size.width/2-35,
          child: Column(
            children: <Widget>[
              Container(
                width: 70,height: 70,
                padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                decoration: BoxDecoration(
                    color: mainColor,
                    shape: BoxShape.circle
                ),
                child: Image.asset(selected==BottomNavigationItems.SCAN?"images/searching100.png":"images/searching40.png",fit: BoxFit.fitHeight,),
              ),
              Text("Scan",
                style: TextStyle(
                  color: selected==BottomNavigationItems.SCAN?Colors.white:Colors.white.withOpacity(0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
Widget tootAppBar(){
  return AppBar(
    leading: Icon(
      Icons.person_pin,
      size: 40,
      color: Colors.white,
    ),
    actions: [
      Icon(
        Icons.dehaze
      ),
      SizedBox(width: 16,),
    ],
    centerTitle: true,
  );
}
class BottomNavigationItems{
  static const int MUSEUMS =0;
  static const int MONUMENT =1;
  static const int SCAN =2;
  static const int RECOMMENDED =3;
  static const int GIFTS =4;
}