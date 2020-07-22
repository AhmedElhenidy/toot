import 'package:flutter/material.dart';
import 'package:toot/statics/colors.dart';
import 'package:toot/statics/statics.dart';
import 'package:toot/ui/recommended_monuments.dart';
import 'package:toot/ui/recommended_museums.dart';
class Recommended extends StatefulWidget {
  @override
  _RecommendedState createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: tootAppBar(),
      bottomNavigationBar: bottomBar(size,BottomNavigationItems.RECOMMENDED),
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 126,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image.asset("images/reco2.png",height: 102,),
                          Container(
                            width: size.width,
                            height: 24,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text("Book a photographer",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image.asset("images/reco1.png",height: 102,),
                          Container(
                            width: size.width,
                            height: 24,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text("Book a visit with a tour guide",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text("Recommendations based \n"
                "on your country visitors",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    width: 106,
                    height: 106,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RecommendedMonuments()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/giza100.png",width: 42,height: 42,),
                          Text("Monuments",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    width: 106,
                    height: 106,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RecommendedMuseums()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("images/museum100.png",width: 36,height: 37,),
                          Text("Museums",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 16,),
                  Container(width: 35,height: 33.63,),
                  Container(
                    padding: EdgeInsets.all(4),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: mainColor,
                      ),
                      shape: BoxShape.rectangle
                    ),
                    child: Center(child: Image.asset("images/recommended0.png")),
                  ),
                  SizedBox(width: 16,),
                  Image.asset("images/vip.png",width: 35,height: 33.63,),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text("chat now with tourists from your country"
               " to get recommendations in your tour",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
