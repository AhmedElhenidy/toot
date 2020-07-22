import 'package:flutter/material.dart';
import 'package:toot/statics/statics.dart';
class RecommendedMonuments extends StatefulWidget {
  @override
  _RecommendedMonumentsState createState() => _RecommendedMonumentsState();
}

class _RecommendedMonumentsState extends State<RecommendedMonuments> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: tootAppBar(),
      bottomNavigationBar: bottomBar(size,BottomNavigationItems.RECOMMENDED),

    );
  }
}
