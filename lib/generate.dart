import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String qrData = "https://github.com/leozeza";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Generate"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              QrImage(
                foregroundColor: Colors.deepPurple,
                data: qrData,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Get your data/link to the QR Code"),
              TextField(
                controller: qrText,
                decoration: InputDecoration(
                  hintText: "Enter the Data/Link",
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              // Don't need any action to generate a new qr code, just chante
              // data of the QR Image and change the state, it will automaticcaly
              // generate the QR code

              FlatButton(
                padding: EdgeInsets.all(15.0),
                child: Text("Generate"),
                onPressed: () {
                  if (qrText.text.isEmpty) {
                    setState(() {
                      qrData = "https://github.com/leozeza";
                    });
                  } else {
                    setState(() {
                      qrData = qrText.text;
                    });
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.deepPurple, width: 3.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final qrText = TextEditingController();
}
