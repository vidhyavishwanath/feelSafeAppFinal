import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String appDocPath = "";
  getPaths() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    appDocPath = appDocDir.path;
    setState(() {
    });
  }
    @override
    void initState() {
      super.initState();
      getPaths();
      bool fileExists = File(appDocPath+ "/database.json").existsSync();
      new Future.delayed(
          Duration(seconds: 3),
              () {
                if(fileExists){
                  Navigator.pushNamed(context, '/home');
                } else {
                  Navigator.pushNamed(context, '/signup');
                }
              }
      );
    }
    Widget build(BuildContext context) {
      var image = Image.asset('assets/images/FeelSafe.png');
      return Scaffold(
          body: Container(
              color: Colors.white,
              child: Center(
                  child: image
              )
          )
      );
    }
  }
