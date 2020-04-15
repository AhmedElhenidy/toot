import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
class QR extends StatefulWidget {
  @override
  _QRState createState() => _QRState();
}

class _QRState extends State<QR> {
  String _qrInfo = 'Scan';
  _scanCode()async {
    String cameraScanResult = await scanner.scan();
    print(cameraScanResult);
    setState(() {
      _qrInfo=cameraScanResult;
    });
   }
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scan"),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            child: Text("$_qrInfo"),
            onPressed: _scanCode,
          ),
        ),
      )

    );
  }
}
