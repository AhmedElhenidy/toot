import 'package:flutter/material.dart';
import 'package:toot/statics/colors.dart';

import 'monument_info.dart';
class MonumentSearch extends StatefulWidget {
  @override
  _MonumentSearchState createState() => _MonumentSearchState();
}
class _MonumentSearchState extends State<MonumentSearch> {
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
        padding: EdgeInsets.only(left: 16,right: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.all(16),
                height: size.height/3.61,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 2,
                    color: mainColor,
                    style: BorderStyle.solid
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text("Statue of Tutankhamun",
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w900
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text("The mask of Tutankhamun's mummy, in the Egyptian"
                                "Museum Tutankhamun is one of the pharaohs of the"
                                "family The eighteenth Egyptian in the history of"
                                "ancient Egypt, Pharaoh was Egypt from 1334"
                                "to 1325 BC",
                              style: TextStyle(
                                color: mainColor,
                                fontSize: size.width*0.028,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 8,),
                            FlatButton(
                              shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),
                              color: mainColor,
                              textColor: Colors.white,
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MonumentInfo()),
                                );
                              },
                              child: Text("  Know more  ",
                                style: TextStyle(
                                  fontSize: 12
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Image.asset("images/monument1.png",fit: BoxFit.fill,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.all(16),
                height: size.height/3.61,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: 2,
                      color: mainColor,
                      style: BorderStyle.solid
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text("Statue of Tutankhamun",
                              style: TextStyle(
                                  color: mainColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text("The mask of Tutankhamun's mummy, in the Egyptian"
                                "Museum Tutankhamun is one of the pharaohs of the"
                                "family The eighteenth Egyptian in the history of"
                                "ancient Egypt, Pharaoh was Egypt from 1334"
                                "to 1325 BC",
                              style: TextStyle(
                                color: mainColor,
                                fontSize: size.width*0.028,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 8,),
                            FlatButton(
                              shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              color: mainColor,
                              textColor: Colors.white,
                              onPressed: (){},
                              child: Text("  Know more  ",
                                style: TextStyle(
                                    fontSize: 12
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Image.asset("images/monument1.png",fit: BoxFit.fill,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.all(16),
                height: size.height/3.61,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: 2,
                      color: mainColor,
                      style: BorderStyle.solid
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text("Statue of Tutankhamun",
                              style: TextStyle(
                                  color: mainColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text("The mask of Tutankhamun's mummy, in the Egyptian"
                                "Museum Tutankhamun is one of the pharaohs of the"
                                "family The eighteenth Egyptian in the history of"
                                "ancient Egypt, Pharaoh was Egypt from 1334"
                                "to 1325 BC",
                              style: TextStyle(
                                color: mainColor,
                                fontSize: size.width*0.028,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 8,),
                            FlatButton(
                              shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              color: mainColor,
                              textColor: Colors.white,
                              onPressed: (){},
                              child: Text("  Know more  ",
                                style: TextStyle(
                                    fontSize: 12
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Image.asset("images/monument1.png",fit: BoxFit.fill,),
                      ),
                    ),
                  ],
                ),
              ),SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.all(16),
                height: size.height/3.61,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: 2,
                      color: mainColor,
                      style: BorderStyle.solid
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text("Statue of Tutankhamun",
                              style: TextStyle(
                                  color: mainColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text("The mask of Tutankhamun's mummy, in the Egyptian"
                                "Museum Tutankhamun is one of the pharaohs of the"
                                "family The eighteenth Egyptian in the history of"
                                "ancient Egypt, Pharaoh was Egypt from 1334"
                                "to 1325 BC",
                              style: TextStyle(
                                color: mainColor,
                                fontSize: size.width*0.028,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 8,),
                            FlatButton(
                              shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              color: mainColor,
                              textColor: Colors.white,
                              onPressed: (){},
                              child: Text("  Know more  ",
                                style: TextStyle(
                                    fontSize: 12
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Image.asset("images/monument1.png",fit: BoxFit.fill,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left:8.0,right: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors3,
            ),
          ),
          height: 60,
          width: size.width,
          child: Center(
            child: Text("Scan with another way",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
