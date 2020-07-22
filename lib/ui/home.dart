import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toot/api/home_api.dart';
import 'package:toot/model/gifts_model.dart';
import 'package:toot/model/monuments_model.dart';
import 'package:toot/model/museum_model.dart';
import 'package:toot/statics/colors.dart';
import 'package:toot/ui/gift_houses.dart';
import 'package:toot/ui/monument_search.dart';
import 'package:toot/ui/monuments.dart';
import 'package:toot/ui/recommended.dart';
import 'package:toot/ui/scan.dart';
import 'monument_info.dart';
import 'mueseums.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
             height: sectionHeight+4,
             child: Column(
               children: [
                 Container(
                   padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 8),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Museums"),
                       InkWell(
                         onTap: (){
                           Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => Museums(museumsList)),
                           );
                         },
                         child: Text("More"),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   width:width ,
                   height: 104,
                   child: ListView.builder(
                     itemCount: museumsList.length,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context,position){
                       MuseumsModel museum =museumsList[position];
                       return Container(
                         padding: EdgeInsets.only(left: 8,right: 8),
                         height: 90,
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
                       InkWell(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => Monuments(monumentsList)),
                           );
                         },
                         child: Text("More"),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   width:width ,
                   height: 100,
                   child: ListView.builder(
                     itemCount: monumentsList.length,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context,position){
                       MonumentsModel monument =monumentsList[position];
                       return InkWell(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => MonumentInfo(id: monument.id,)),
                           );
                         },
                         child: Container(
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
                       InkWell(
                         onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GiftsAndHouses(giftsList)),
                            );
                         },
                         child: Text("More"),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   width:width ,
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
                       InkWell(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => Scan()),
                           );
                         },
                         child: Text("More"),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   width:width ,
                   height: 100,
                   child: ListView.builder(
                     itemCount: 5,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context,position){
                       return Container(
                         padding: EdgeInsets.only(left: 8,right: 8),
                         height: 85,
                         width: 85,
                         child: InkWell(
                           onTap:
                           position==0
                               ?()async{
                             await scanner.scan().then((name){
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => MonumentSearch(name)),
                               );
                             });
                            }
                            :position==2
                               ?()async{
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
                               } on Exception {
                                 texts.add(new OcrText('Failed to recognize text.'));
                               }

                           }:(){},
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
                       InkWell(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => Recommended()),
                           );
                         },
                         child: Text("More"),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   width:width ,
                   height: 100,
                   child: ListView.builder(
                     itemCount: 3,
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
