import 'package:flutter/material.dart';
import 'package:toot/statics/colors.dart';
import 'package:toot/ui/scan_camera.dart';
class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}
class _ScanState extends State<Scan> {
  int currentIndex =2 ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      //bottomNavigationBar: BottomNavigationBar(),
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
            Container(height: size.height/14,),
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
