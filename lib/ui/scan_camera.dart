import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:toot/statics/colors.dart';
import 'monument_search.dart';
import 'package:qrscan/qrscan.dart' as scanner;
class ScanCamera extends StatefulWidget {
  @override
  _ScanCameraState createState() => _ScanCameraState();
}
class _ScanCameraState extends State<ScanCamera> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Icon(
            Icons.dehaze,
            size: 35,
          ),
          Container(width: 16,),
        ],
      ),
      body: Container(
        width: size.width ,
        height: size.height,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Camera",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                color: mainColor,
                fontWeight: FontWeight.w900,
                height: 3,
              ),
            ),
            SizedBox(
              height: size.height/14,
            ),
            Container(
              width: size.width/1.2,
              height: size.height/2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: gradientColors7
                  ),
                color: mainColor,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        child: Image.asset("images/qr_scan.png",width: size.width/4,height: size.height/5,),
                        onTap: ()async{
                           await scanner.scan().then((name){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => MonumentSearch(name)),
                             );
                           });
                        },
                      ),
                      Image.asset("images/name_scan.png",width: size.width/4,height: size.height/5,),
                    ],
                  ),
                  Image.asset("images/monument_scan.png",width: size.width/4,height: size.height/5,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
