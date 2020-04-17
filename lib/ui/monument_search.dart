import 'package:flutter/material.dart';
import 'package:toot/api/get_monument_api.dart';
import 'package:toot/model/monument.dart';
import 'package:toot/statics/colors.dart';
import 'package:toot/statics/statics.dart';
import 'monument_info.dart';
class MonumentSearch extends StatefulWidget {
  String name;
  MonumentSearch(this.name);
  @override
  _MonumentSearchState createState() => _MonumentSearchState();
}
class _MonumentSearchState extends State<MonumentSearch> {
  GetMonumentServerResponse monumentInfo;
  bool searchApiFlag =false ;
  searchApi(){
    setState(() {
      searchApiFlag =true;
    });
    GetMonumentApi().getMonument("${widget.name}").then((response){
      this.monumentInfo =response;
      this.monumentInfo.voice_note=hostName+response.voice_note.substring(1);
      print(hostName+response.voice_note.substring(1));
      print("$hostName${monumentInfo.monumentImage[0].image.substring(1)}");
      print(monumentInfo.voice_note);
      setState(() {
        searchApiFlag =false;
      });
    },onError: (error){
      setState(() {
        searchApiFlag=false;
        print(error.toString());
      });
    });
  }
  @override
  void initState() {
    super.initState();
    searchApi();
  }
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: bottomBar(size),
      appBar: AppBar(
        actions: <Widget>[
          Icon(
            Icons.dehaze,
            size: 35,
          ),
          Container(width: 16,),
        ],
      ),
      body: searchApiFlag?Center(child: CircularProgressIndicator(),):Container(
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
                height: 201,
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
                            Text("${monumentInfo.name}",
                              style: TextStyle(
                                  color: mainColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text("${monumentInfo.description}",
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 6,),
                            FlatButton(
                              shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              color: mainColor,
                              textColor: Colors.white,
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MonumentInfo(monumentInfo)),
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
                       // child: Image.network("http://www.egymuseums.somee.com/Content/images/Menuments/monument120021605484.png",fit: BoxFit.fill,),
                        child: Image.network("$hostName${monumentInfo.monumentImage[0].image.substring(1)}",fit: BoxFit.fill,),
                      ),
                    ),
                  ],
                ),
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