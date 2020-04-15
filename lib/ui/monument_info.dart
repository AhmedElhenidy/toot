import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toot/api/get_monument_api.dart';
import 'package:toot/model/monument.dart';
import 'package:toot/statics/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
class MonumentInfo extends StatefulWidget {
  GetMonumentServerResponse monumentDetails;
  MonumentInfo(this.monumentDetails);
  @override
  _MonumentInfoState createState() => _MonumentInfoState();
}
class _MonumentInfoState extends State<MonumentInfo> {
  double fontSize = 15 ;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  bool musicOn =false;
  @override
  void initState() {
    super.initState();
    GetMonumentApi().getMonument("Statue of Tutankhamun");
    initPlayer();
  }

  void initPlayer() {
   advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
      _duration = d;
    });

    advancedPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });
  }
  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }
  String localFilePath;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Icon(
            Icons.dehaze,
            size: 35,
          ),
          Container(width: 16,),
        ],
      ),
      body: Container(
        width: size.width ,
        height: size.height,
        padding: EdgeInsets.only(left: 16,right: 16),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 32,
                  ),
                  Text("${widget.monumentDetails.name}",
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          width: 2,
                          color: mainColor,
                          style: BorderStyle.solid
                      ),
                    ),
                    child: Stack(
                        children: [
                          CarouselSlider(
                            items: [
                              Image.network(widget.monumentDetails.monumentImage[0].image),
                              //Image.network(widget.monumentDetails.monumentImage[1].image),
                            ],
                            autoPlay: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index) {
                              setState(() {
                                //_current = index;
                              });
                            },
                          ),
                        ]
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child:musicOn? Column(
                      children: <Widget>[
                        Slider(
                          onChangeStart:(double value) {
                            print("on changed start");
                            setState(() {
                              advancedPlayer.seek(Duration(seconds: value.toInt()));
                              seekToSecond(value.toInt());
                            });
                          } ,
                          onChangeEnd:(double value) {
                            print("on changed end");
                            setState(() {
                              advancedPlayer.seek(Duration(seconds: value.toInt()));
                              seekToSecond(value.toInt());
                            });
                          },
                            activeColor: mainColor,
                            value: _position.inSeconds.toDouble(),
                            min: 0.0,
                            max: _duration.inSeconds.toDouble(),
                            onChanged: (double value) {
                              print("on changed ");
                              setState(() {
                               advancedPlayer.seek(Duration(seconds: value.toInt()));
                               seekToSecond(value.toInt());
                              });
                            }
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap:()async{
                                /*int result = await advancedPlayer.play(
                            "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
                          );
                          if (result == 1) {
                            print("oh yaaa");
                          }*/
                                audioCache.play('Graduation_project.ogg');
                              },
                              child: Icon(Icons.play_circle_outline,
                                size: 45,
                                color: mainColor,
                              ),
                            ),
                            SizedBox(width: 6,),
                            InkWell(
                              onTap: (){
                                advancedPlayer.pause();
                              },
                              child: Icon(Icons.pause_circle_outline,
                                size: 45,
                                color: mainColor,
                              ),
                            ),
                            SizedBox(width: 8,),
                            InkWell(
                              onTap: (){
                                advancedPlayer.stop();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: mainColor,
                                        width: 3
                                    )
                                ),
                                child: Icon(Icons.stop,
                                  size: 33,
                                  color: mainColor,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ):InkWell(
                      onTap: (){
                        setState(() {
                          musicOn=true;
                        });
                        audioCache.play('Graduation_project.ogg');
                      },
                      child: Image.asset("images/click_to_play.png",height: size.height/9,),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text("${widget.monumentDetails.description}",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: fontSize
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Image.asset("images/egyptaian_museum.png",height: size.height/4,),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 65,
              right: size.width/2.7,
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      setState(() {
                        fontSize++;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color:mainColor,
                        shape: BoxShape.circle,
                        //borderRadius: BorderRadius.circular(8)
                      ),
                      child: Icon(
                        Icons.zoom_in,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                  Container(
                    width: 16,
                  ),
                  InkWell(
                    onTap: (){
                      if(!(fontSize<16))
                        fontSize--;
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color:mainColor,
                        shape: BoxShape.circle,
                        //borderRadius: BorderRadius.circular(8)
                      ),
                      child: Icon(
                        Icons.zoom_out,
                        color: Colors.white,
                        size: 35,
                      ),
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
