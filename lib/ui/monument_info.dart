import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:toot/api/get_monument_api.dart';
import 'package:toot/statics/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:audioplayers/audioplayers.dart';
class MonumentInfo extends StatefulWidget {
  @override
  _MonumentInfoState createState() => _MonumentInfoState();
}
class _MonumentInfoState extends State<MonumentInfo> {
  double fontSize = 15 ;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    GetMonumentApi().getMonument("Statue of Tutankhamun");
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer(
      mode: PlayerMode.LOW_LATENCY
    );
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
                  Text("Statue of Tutankhamun",
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
                              Image.asset("images/monument1.png"),
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
                  Slider(
                      activeColor: mainColor,
                      value: _position.inSeconds.toDouble(),
                      min: 0.0,
                      max: _duration.inSeconds.toDouble(),
                      onChanged: (double value) {
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
                          audioCache.play('toot.m4a');
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
                  InkWell(
                    onTap: (){},
                    child: Image.asset("images/click_to_play.png",height: size.height/9,),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Tutankhamun, one of the pharaohs of the eighteenth "
                      "Egyptian family in the history of ancient Egypt, was "
                      "the Pharaoh of Egypt from 1334 to 1325 BC. In the era of "
                      "the modern state. Tutankhamun is one of the most "
                      "famous of the Pharaohs for reasons not related to the "
                      "achievements he has achieved or wars he won, as is the "
                      "case with many Pharaohs; but for other reasons that "
                      "are historically important, most notably the discovery "
                      "of his tomb and his treasures completely without any "
                      "damage. The mystery surrounding the circumstances of "
                      "his death as many considered the death of Pharaoh at "
                      "a very young age is abnormal, especially with the S"
                      "effects of fractures in the bones of the thigh and skull,"
                      "and the marriage of his minister to his widow after his "
                      "death and the inauguration of Pharaoh himself. All "
                      "these  mysterious events, and the heavy use of the myth "
                      "of the Pharaohs curse  associated with the tomb of "
                      "Tutankhamun used in movies and video games have "
                      "made Tutankhamun the most famous puzzles for "
                      "puzzles and still unanswered questions, considered by "
                      "some of the oldest assassinations in the history of "
                      "humanity. The young Tutankhamun died and was "
                      "buried in his tomb - Cemetery 62 - in the Valley of the Kings.",
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
