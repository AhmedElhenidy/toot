import 'package:flutter/material.dart';
import 'package:toot/statics/colors.dart';
import 'package:toot/ui/scan_camera.dart';
class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}
class _ScanState extends State<Scan> {
  int currentIndex =0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      bottomSheet:Container(
        color: Colors.transparent,
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
                      icon: Image.asset("images/museum40.png",width: 30,height: 30,),
                      title: Text("Museums",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset("images/giza40.png",width: 30,height: 35,),
                      title: Text("Monuments",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Container(height: 30,),
                      title: Container()
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset("images/badge40.png",width: 30,height: 30,),
                      title: Text("Recommended",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset("images/gift40.png",width: 30,height: 30,),
                      title: Text("gifts",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
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
                    child: Image.asset("images/searching100.png",fit: BoxFit.fitHeight,),
                  ),
                  Text("Scan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      /*
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        backgroundColor: mainColor,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("images/museum40.png",width: 30,height: 30,),
            title: Text("Museum",
              style: TextStyle(
                  color: Colors.red
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/giza40.png",width: 30,height: 35,),
            title: Text("Museum",
              style: TextStyle(
                  color: Colors.red
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Container(),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/badge40.png",width: 30,height: 30,),
            title: Text("Museum",
              style: TextStyle(
                  color: Colors.red
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/gift40.png",width: 30,height: 30,),
            title: Text("Museum",
              style: TextStyle(
                  color: Colors.red
              ),
            ),
          )
        ],
      ),
      */
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text("Scan Monument",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                color: mainColor,
                fontWeight: FontWeight.w900,
                height: 3,
              ),
            ),
            Container(height: size.height/16,),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScanCamera()),
                );
              },
              child: Image.asset("images/camera.png"),
            ),
            Row(
              children: <Widget>[
                Container(
                  height: size.height/4,
                  width: size.width/2-16,
                  child: Image.asset("images/voice.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: size.height/4,
                  width: size.width/2-16,
                  child: Image.asset("images/write.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
