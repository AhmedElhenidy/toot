import 'package:flutter/material.dart';
import 'package:toot/statics/statics.dart';
class RecommendedMuseums extends StatefulWidget {
  @override
  _RecommendedMuseumsState createState() => _RecommendedMuseumsState();
}

class _RecommendedMuseumsState extends State<RecommendedMuseums> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: tootAppBar(),
      bottomNavigationBar: bottomBar(size,BottomNavigationItems.RECOMMENDED),

    );
  }
}
