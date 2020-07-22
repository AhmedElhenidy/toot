import 'dart:math';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:toot/statics/colors.dart';
import 'package:toot/statics/statics.dart';
import 'package:toot/ui/monument_search.dart';
import 'package:toot/ui/scan_camera.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}
class _ScanState extends State<Scan> {
  int currentIndex =0;
  bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "";
  List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState();
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    if (hasSpeech) {
      _localeNames = await speech.locales();

      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale.localeId;
    }
    startListening();
    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar:bottomBar(size,BottomNavigationItems.SCAN),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text("Scan Monument",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                color: mainColor,
                fontWeight: FontWeight.w900,
                height: 2,
              ),
            ),
            Container(height: size.height/22,),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScanCamera()),
                );
              },
              child: Image.asset("images/camera.png"),
            ),
            Row(
              children: <Widget>[
                Container(
                  height: size.height/4,
                  width: size.width/2-16,
                  child: InkWell(
                    onTap: ()async{
                      initSpeechState();

                    },
                    child: Image.asset("images/voice.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: size.height/4,
                  width: size.width/2-16,
                  child: Image.asset("images/write.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  void startListening() {
    print("listen started");
    lastWords = "";
    lastError = "";
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 10),
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        partialResults: true,
        onDevice: true,
        listenMode: ListenMode.confirmation);
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    if(result.finalResult){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MonumentSearch(result.recognizedWords)),
      );
    }
    setState(() {
      lastWords = "${result.recognizedWords} - ${result.finalResult}";
      print("==================confidence\n${result.confidence}");
      print("================== alternates  \n${result.alternates}");
      print("==================type\n${result.runtimeType}");
      print("==================\n$lastWords");
    });
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    // print("Received error status: $error, listening: ${speech.isListening}");
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    // print(
    // "Received listener status: $status, listening: ${speech.isListening}");
    setState(() {
      lastStatus = "$status";
    });
  }

  _switchLang(selectedVal) {
    setState(() {
      _currentLocaleId = selectedVal;
    });
    print(selectedVal);
  }
}
