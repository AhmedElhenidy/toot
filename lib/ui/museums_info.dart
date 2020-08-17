import 'package:flutter/material.dart';
import 'package:toot/api/get_museums_info_api.dart';
import 'package:toot/model/Museums_info_model.dart';
import 'package:toot/statics/colors.dart';
import 'package:toot/statics/statics.dart';
class MuseumInfo extends StatefulWidget {
  int id;
  MuseumInfo(this.id);
  @override
  _MuseumInfoState createState() => _MuseumInfoState();
}

class _MuseumInfoState extends State<MuseumInfo> {
  MuseumsInfoModel museum ;
  bool loading = false ;
  getMuseum(){
    setState(() =>loading=true);
    GetMuseumInfoApiProvider.getMuseum(
        id: widget.id,
        onError: ()=>setState(() =>loading=true),
        onSuccess: (museums){
          setState(() {
            this.museum=museums;
            loading=false;
          });
        }
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMuseum();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: tootAppBar(),
      bottomNavigationBar: bottomBar(size,BottomNavigationItems.MUSEUMS),
      body: loading?Center(child: CircularProgressIndicator()):Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 16,),
              Text(museum==null?"":museum.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 16,),
              Image.network(museum==null?"":museum.images[0].image),
              SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.5,
                            color: mainColor,
                          )
                      ),
                      child: Center(child: Text("Type: Historical",style: TextStyle(fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.5,
                            color: mainColor,
                          )
                      ),
                      child: Center(child: Text(" Government:Cairo",style: TextStyle(fontWeight: FontWeight.bold),)),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16,),
              Text("Internal map",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Image.network(museum==null?"":museum.map),
              Container(
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: mainColor,
                    )
                ),
                child: Center(child: Text("Type: Historical",
                  style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
