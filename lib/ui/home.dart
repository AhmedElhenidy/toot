
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toot/api/home_api.dart';
import 'package:toot/model/gifts_model.dart';
import 'package:toot/model/monuments_model.dart';
import 'package:toot/model/museum_model.dart';
import 'package:toot/statics/colors.dart';
import 'package:toot/statics/data_constatnts.dart';
class Home extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  List<String> scanImages=[""];
  List<String> scanNames=["QR code","scan monument","scan name","write","voice"];
  List<String> recommendedImages=[];
  double sectionHeight =140;
  double itemHeight =85;
  List<MuseumsModel> museumsList=[];
  List<MonumentsModel> monumentsList=[];
  List<GiftsModel> giftsList=[];

  bool loading= false;
  getHomeSections(){
    setState(() =>loading=true);
    HomeApiProvider.getHome(
        onError: ()=>setState(() =>loading=true),
        onSuccess: (museums,monuments,places){
          setState(() {
            museumsList.clear();
            museumsList.addAll(museums);
            monumentsList.clear();
            monumentsList.addAll(monuments);
            giftsList.clear();
            giftsList.addAll(places);
            loading=false;
          });
        }
    );
  }
  @override
  void initState() {
    super.initState();
    getHomeSections();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.person_pin,
          size: 40,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
         children: [
           //Museums
           Container(
             height: sectionHeight,
             child: Column(
               children: [
                 Container(
                   padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 8),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Museums"),
                       Text("More"),
                     ],
                   ),
                 ),
                 Container(
                   width:size.width ,
                   height: 100,
                   child: ListView.builder(
                     itemCount: museumsList.length,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context,position){
                       MuseumsModel museum =museumsList[position];
                       return Container(
                         padding: EdgeInsets.only(left: 8,right: 8),
                         height: 85,
                          width: 126,
                         child: Column(
                           children: [
                              Container(
                                color: mainColor,
                                width: 126,height: 72,
                                child: Image.network("${museum.images.length>0?museum.images.first.image??"":""}",fit: BoxFit.fill,),
                              ),
                              SizedBox(height: 8,),
                             Container(
                               width: 126,
                               child: Text("${museum.name}",
                                 textAlign: TextAlign.start,
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                               ),
                             ),
                           ],
                         ),
                       );
                     },
                   ),
                 ),
               ],
             ),
           ),
           //Monuments
           Container(
             height: sectionHeight,
             child: Column(
               children: [
                 Container(
                   padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 8),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Monuments"),
                       Text("More"),
                     ],
                   ),
                 ),
                 Container(
                   width:size.width ,
                   height: 100,
                   child: ListView.builder(
                     itemCount: monumentsList.length,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context,position){
                       MonumentsModel monument =monumentsList[position];
                       return Container(
                         padding: EdgeInsets.only(left: 8,right: 8),
                         height: 85,
                         width: 126,
                         child: Column(
                           children: [
                             Container(
                               color: mainColor,
                               width: 126,height: 72,
                               child: Image.network("${monument.images.length>0?monument.images.first.image??"":""}",fit: BoxFit.fill,),
                             ),
                             SizedBox(height: 8,),
                             Container(
                               width: 126,
                               child: Text("${monument.name}",
                                 textAlign: TextAlign.start,
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                               ),
                             ),
                           ],
                         ),
                       );
                     },
                   ),
                 ),
               ],
             ),
           ),
           //gifts
           Container(
             height: sectionHeight,
             child: Column(
               children: [
                 Container(
                   padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 8),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Gifts"),
                       Text("More"),
                     ],
                   ),
                 ),
                 Container(
                   width:size.width ,
                   height: 100,
                   child: ListView.builder(
                     itemCount: giftsList.length,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context,position){
                       GiftsModel gift =giftsList[position];
                       return Container(
                         padding: EdgeInsets.only(left: 8,right: 8),
                         height: 85,
                         width: 126,
                         child: Column(
                           children: [
                             Container(
                               color: mainColor,
                               width: 126,height: 70,
                               child: Image.network("${gift.photo}",fit: BoxFit.fill,),
                             ),
                             SizedBox(height: 6,),
                             Container(
                               width: 126,
                               child: Text("${gift.name}",
                                 textAlign: TextAlign.start,
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                               ),
                             ),
                           ],
                         ),
                       );
                     },
                   ),
                 ),
               ],
             ),
           ),
           //scan monument
           Container(
             height: sectionHeight,
             child: Column(
               children: [
                 Container(
                   padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 8),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Scan Monuments"),
                       Text("More"),
                     ],
                   ),
                 ),
                 Container(
                   width:size.width ,
                   height: 100,
                   child: ListView.builder(
                     itemCount: 5,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context,position){
                       return Container(
                         padding: EdgeInsets.only(left: 8,right: 8),
                         height: 85,
                         width: 85,
                         child: Column(
                           children: [
                             Container(
                               width: 62,height: 72,
                               child: Image.asset("images/scanImage$position.png",fit: BoxFit.fill,),
                             ),
                             SizedBox(height: 8,),
                             Container(
                               width: 110,
                               child: Text(scanNames[position],
                                 textAlign: TextAlign.start,
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                               ),
                             ),
                           ],
                         ),
                       );
                     },
                   ),
                 ),
               ],
             ),
           ),
           //Recommended
           Container(
             height: sectionHeight,
             child: Column(
               children: [
                 Container(
                   padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 8),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Recommended"),
                       Text("More"),
                     ],
                   ),
                 ),
                 Container(
                   width:size.width ,
                   height: 100,
                   child: ListView.builder(
                     itemCount: 5,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context,position){
                       return Container(
                         padding: EdgeInsets.only(left: 8,right: 8),
                         height: 85,
                         width: 126,
                         child: Column(
                           children: [
                             Container(
                               width: 123,height: 72,
                               child: Image.asset("images/recommended$position.png",fit: BoxFit.fill,),
                             ),
                           ],
                         ),
                       );
                     },
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
