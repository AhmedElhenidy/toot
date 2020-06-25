import 'package:flutter/material.dart';
import 'package:toot/model/museum_model.dart';
import 'package:toot/statics/colors.dart';
import 'package:toot/statics/statics.dart';
class Museums extends StatefulWidget {
  List<MuseumsModel> museumsList;
  Museums(this.museumsList);
  @override
  _MuseumsState createState() => _MuseumsState();
}

class _MuseumsState extends State<Museums> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: tootAppBar(),
      bottomNavigationBar: bottomBar(size,BottomNavigationItems.MUSEUMS),
      body: Container(
        padding: EdgeInsets.only(top: 16,left: 16,right: 16),
        width: size.width,
        height: size.height-100,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top:16,bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 34,
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
                          Text("   Museum Type"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 34,
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
                itemCount: widget.museumsList.length,
                itemBuilder: (context,position){
                  MuseumsModel museum =widget.museumsList[position];
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
