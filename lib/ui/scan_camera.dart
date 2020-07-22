import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:toot/statics/colors.dart';
import 'package:toot/statics/statics.dart';
import 'monument_search.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
class ScanCamera extends StatefulWidget {
  @override
  _ScanCameraState createState() => _ScanCameraState();
}
class _ScanCameraState extends State<ScanCamera> {
  String _textValue="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(MediaQuery.of(context).size,BottomNavigationItems.SCAN),
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
        width: MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height,
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
                height: 2,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/22,
            ),
            Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: MediaQuery.of(context).size.height/2,
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
                        child: Image.asset("images/qr_scan.png",width: MediaQuery.of(context).size.width/4,height: MediaQuery.of(context).size.height/5,),
                        onTap: ()async{
                           await scanner.scan().then((name){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => MonumentSearch(name)),
                             );
                           });
                        },
                      ),
                      InkWell(
                        child: Image.asset("images/name_scan.png",width: MediaQuery.of(context).size.width/4,height: MediaQuery.of(context).size.height/5,),
                        onTap: ()async{
                          List<OcrText> texts = [];
                          try {
                           await FlutterMobileVision.read(
                              autoFocus: true,
                              showText: true,
                              multiple: true,
                              waitTap: true,
                            ).then((value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MonumentSearch(value.first.value??"")),
                              );
                            });

                            setState(() {
                              _textValue = texts[0].value; // Getting first text block....
                              print("============\n${texts.length}");
                            });
                          } on Exception {
                            texts.add(new OcrText('Failed to recognize text.'));
                          }
                        },
                      ),
                    ],
                  ),
                  Image.asset("images/monument_scan.png",width: MediaQuery.of(context).size.width/4,height: MediaQuery.of(context).size.height/5,),

                  Text("read Text :::\n$_textValue",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
