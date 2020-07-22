import 'package:flutter/material.dart';
import 'package:toot/api/gifts_and_houses_api.dart';
import 'package:toot/model/gifts_model.dart';
import 'package:toot/model/house_model.dart';
import 'package:toot/statics/colors.dart';
import 'package:toot/statics/statics.dart';
class GiftsAndHouses extends StatefulWidget {
  List<GiftsModel> gifts;
  GiftsAndHouses(this.gifts);
  @override
  _GiftsAndHousesState createState() => _GiftsAndHousesState();
}

class _GiftsAndHousesState extends State<GiftsAndHouses> {
  bool loading = false;
  List<HousesModel> houses =[];
  getHomeHouses(){
    setState(() =>loading=true);
    GiftsAndHousesApiProvider.getHouses(
        onError: ()=>setState(() =>loading=true),
        onSuccess: (houses){
          setState(() {
            this.houses.addAll(houses);
            loading=false;
          });
        }
    );
  }
  @override
  void initState() {
    super.initState();
    print("housesssssssss=========================================\n");
    getHomeHouses();

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.person_pin,
            size: 40,
            color: Colors.white,
          ),
          actions: [
            Icon(
                Icons.dehaze
            ),
            SizedBox(width: 16,),
          ],
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: mainColor,
            tabs: [
              Tab(text: "Gifts",),
              Tab(text: "Houses",),
            ],
          ),
        ),
        bottomNavigationBar: bottomBar(size,BottomNavigationItems.GIFTS),
        body: TabBarView(
          children: [
            Gifts(widget.gifts??[]),
            Houses(this.houses??[],this.loading),
          ],
        ),
      ),
    );
  }
}

class Gifts extends StatelessWidget {
  List<GiftsModel> giftsList;
  Gifts( this.giftsList);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: giftsList.length,
      itemBuilder: (context,position){
        GiftsModel gift = giftsList[position];
        return Container(
          height: 265,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text("${gift.name}",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
              Image.network("${gift.photo}",
                width: MediaQuery.of(context).size.width,height: 226,),
            ],
          ),
        );
      },
    );
  }
}
class Houses extends StatefulWidget {
  List<HousesModel> houseList;
  bool loading;
  Houses( this.houseList,this.loading);
  @override
  _HousesState createState() => _HousesState();
}
class _HousesState extends State<Houses> {
  List<HousesModel> houseList;
  bool loading;
  @override
  void initState() {
    super.initState();
    this.houseList=widget.houseList;
    this.loading=widget.loading;
  }
  @override
  Widget build(BuildContext context) {
      return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: houseList.length,
      itemBuilder: (context,position){
        HousesModel house = houseList[position];
        return Container(
          height: 265,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text("${house.name}",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8,),
              Image.network("${house.photo}",
                width: MediaQuery.of(context).size.width,
                height: 218,
                fit: BoxFit.fill,
              ),
            ],
          ),
        );
      },
    );
  }
}