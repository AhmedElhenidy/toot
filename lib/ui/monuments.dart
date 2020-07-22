import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toot/model/monuments_model.dart';
import 'package:toot/model/museum_model.dart';
import 'package:toot/statics/colors.dart';
import 'package:toot/statics/statics.dart';
class Monuments extends StatefulWidget {
  List<MonumentsModel> monumentList;
  Monuments(this.monumentList);
  @override
  _MuseumsState createState() => _MuseumsState();
}

class _MuseumsState extends State<Monuments> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: tootAppBar(),
      bottomNavigationBar: bottomBar(size,BottomNavigationItems.MONUMENT),
      body: Container(
        padding: EdgeInsets.only(top: 16,left: 16,right: 16),
        width: size.width,
        height: size.height-100,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top:16,bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 8,right: 8),
                    height: 34,
                    width: 156,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: mainColor,
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.keyboard_arrow_down,color: mainColor,size: 30,),
                        Text("   Governorate"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
           Container(
             width: size.width,
             height: size.height-32-66-100-64,
             child: GridView.builder(
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 crossAxisSpacing: 16,
                 mainAxisSpacing: 16,
                 childAspectRatio: 1.47169
               ),
                itemCount: widget.monumentList.length,
                itemBuilder: (context,position){
                  MonumentsModel museum =widget.monumentList[position];
                  return Container(
                   // width: (size.width/2)-38,
                    child: Column(
                      children: [
                        Container(
                          width: 126,
                          child: Text("${museum.name}",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          color: mainColor,
                          width: (size.width/2)-38,
                          height: 90,
                          child: Image.network("${museum.images.length>0?museum.images.first.image??"":""}",fit: BoxFit.cover,),
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
    );
  }
}
