import 'package:flutter/material.dart';
import 'package:toot/statics/colors.dart';
import 'package:toot/ui/choose_language.dart';
import 'package:toot/ui/qr.dart';
import 'ui/home.dart';
import 'ui/scan.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: mainColor,
        textSelectionColor: Colors.green
      ),
      home: QR(),
    );
  }
}

