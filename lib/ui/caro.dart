import 'package:flutter/material.dart';
import 'package:toot/statics/colors.dart';
import 'package:toot/ui/home.dart';
import 'package:toot/ui/scan.dart';
class Caro extends StatefulWidget {
  @override
  _CaroState createState() => _CaroState();
}

class _CaroState extends State<Caro> {
  int page=0;
  int duration = 300;
  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController(
      initialPage: page,
    );
    PageController _controllerText = PageController(
      initialPage: page,
    );
    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
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
                page++;
                print(page);
               if( page<3)
                    {
                      _controller.animateToPage(page, duration: Duration(milliseconds: duration),curve:Curves.linear);
                      _controllerText.animateToPage(page, duration: Duration(milliseconds: duration),curve:Curves.linear);}

                else
                  Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Scan()),
                        (Route<dynamic> route) => false
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

      ),
      body: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height-120,
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 4,
                child:PageView(
                  onPageChanged: (_page){
                    page=_page;
                    print("current $page");
                    _controllerText.animateToPage(_page, duration: Duration(milliseconds: duration),curve:Curves.linear);
                    setState(() {

                    });
                  },
                  controller: _controller,
                  children: <Widget>[
                    Image.asset("images/caro1.png"),
                    Image.asset("images/caro2.png"),
                    Image.asset("images/caro3.png"),
                  ],
                ),
              ),

              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      child:page==0?Container():
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.white.withOpacity(0.5),
                      ),
                      backgroundImage: AssetImage("images/caro1.png"),
                      backgroundColor: mainColor,
                      radius: page==0?7:5,
                    ),
                    Container(
                      width: 5,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/caro2.png"),
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.white.withOpacity(0.5),
                      ),
                      backgroundColor: Colors.white,
                      radius: page==1?7:5,
                    ),
                    Container(
                      width: 5,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/caro2.png"),
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.white.withOpacity(0.5),
                      ),
                      radius:page==2?7: 5,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 5,
                child: PageView(
                  onPageChanged: (_page){
                    page=_page;
                    print("current $page");
                    _controller.animateToPage(_page, duration: Duration(milliseconds: duration),curve:Curves.linear);
                    setState(() {

                    });
                  },
                  controller: _controllerText,
                  children: <Widget>[
                    Text("You can explore all the museums and the monument In Egypt with toot",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: mainColor,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text("Scan any monument to hear the story or read it easily",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: mainColor,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text("Chat with tourists from your country to get recommendations of your visit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: mainColor,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
