import 'package:flutter/material.dart';
import 'package:toot/ui/caro.dart';
import 'package:toot/statics/colors.dart';
class ChooseLanguage extends StatefulWidget {
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  int selectedLanguage =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 120,
        child: Center(
          child: Container(
            height: 45,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              color: mainColor,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Caro()),
                );
              },
              child: Text(
                "Next",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Language"
        ),
      ),
      body: ListWheelScrollView(
        onSelectedItemChanged: (i){
          setState(() {
            selectedLanguage =i;
          });
        },
        itemExtent: 75,
        magnification: 1.1,
        useMagnifier: true,
        children: <Widget>[
          Container(
            color: selectedLanguage==0?mainColor:Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("Default(English)",
                style: TextStyle(
                  fontSize: 18,
                  color: selectedLanguage==0?Colors.white:Colors.black,
                ),
              ),
            ),
          ),
          Container(
            color: selectedLanguage==1?mainColor:Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("Arabic",
                style: TextStyle(
                  fontSize: 18,
                  color: selectedLanguage==1?Colors.white:Colors.black,
                ),
              ),
            ),
          ),
          Container(
            color: selectedLanguage==2?mainColor:Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("Español",
                style: TextStyle(
                  fontSize: 18,
                  color: selectedLanguage==2?Colors.white:Colors.black,
                ),
              ),
            ),
          ),
          Container(
            color: selectedLanguage==3?mainColor:Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("Deutsch",
                style: TextStyle(
                  fontSize: 18,
                  color: selectedLanguage==3?Colors.white:Colors.black,
                ),
              ),
            ),
          ),
          Container(
            color: selectedLanguage==4?mainColor:Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("Português",
                style: TextStyle(
                  fontSize: 18,
                  color: selectedLanguage==4?Colors.white:Colors.black,
                ),
              ),
            ),
          ),
          Container(
            color: selectedLanguage==5?mainColor:Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("हिन्दी",
                style: TextStyle(
                  fontSize: 18,
                  color: selectedLanguage==5?Colors.white:Colors.black,
                ),
              ),
            ),
          ),
          Container(
            color: selectedLanguage==6?mainColor:Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("Türkçe",
                style: TextStyle(
                  fontSize: 18,
                  color: selectedLanguage==6?Colors.white:Colors.black,
                ),
              ),
            ),
          ),
          Container(
            color: selectedLanguage==7?mainColor:Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("Italiano",
                style: TextStyle(
                  fontSize: 18,
                  color: selectedLanguage==7?Colors.white:Colors.black,
                ),
              ),
            ),
          ),
          Container(
            color: selectedLanguage==8?mainColor:Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("Polski",
                style: TextStyle(
                  fontSize: 18,
                  color: selectedLanguage==8?Colors.white:Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
