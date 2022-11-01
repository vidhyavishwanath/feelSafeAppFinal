import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';
import 'package:url_launcher/url_launcher_string.dart';

class Com {
  static void message(String text, List<String> recipients) async {
    String _result = await sendSMS(message: text, recipients: recipients)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  static void call(String recipient){
    launchUrlString("tel:$recipient");
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  String appDocPath = "";
  String phoneNumber = "";
  getPaths() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    appDocPath = appDocDir.path;
    setState(() {
    });
  }
  getNumber() async {
    File jsonFile = File(appDocPath + "/database.json");
    Map<String, dynamic> jsonFileContent = json.decode(
        jsonFile.readAsStringSync());
    phoneNumber = jsonFileContent["contact1Number"];
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
          leading: Icon(
              Icons.home,
              color: Colors.black,
              size: 45
          ),
          title: Text(
              'Home',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 36
              )
          ),
          backgroundColor: Color(0XFFC1C4FF)
      ),
      body: Column(
          children: <Widget> [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.05
            ),
            Center(
              child: TextButton(
                  onPressed: (){
                    Com.message("Help me, I'm being followed", [getNumber()]);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0XFFFF8080),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(width: 2.0, color: Colors.black),
                    )
                  ),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, MediaQuery.of(context).size.height * 0.05, MediaQuery.of(context).size.width * 0.05, MediaQuery.of(context).size.height * 0.05),
                      child: Text(
                          'SOS Text',
                          style: TextStyle(
                              fontSize: 36,
                              color: Colors.black,
                              letterSpacing: 2
                          )
                      )
                  ),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.03
            ),
            Center(
              child: TextButton(
                  onPressed: (){
                    Com.call('911');
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0XFFC1C4FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(width: 2.0, color: Colors.black),
                      )
                  ),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, MediaQuery.of(context).size.height * 0.05, MediaQuery.of(context).size.width * 0.05, MediaQuery.of(context).size.height * 0.05),
                      child: Text(
                          'Call 911',
                          style: TextStyle(
                              fontSize: 36,
                              color: Colors.black,
                              letterSpacing: 2
                          )
                      )
                  )
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.03
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/fakecall');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0XFFFF8080),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(width: 2.0, color: Colors.black),
                      )
                  ),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, MediaQuery.of(context).size.height * 0.05, MediaQuery.of(context).size.width * 0.05, MediaQuery.of(context).size.height * 0.05),
                      child: Text(
                          'Recorded \n Call',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.black,
                            letterSpacing: 2,
                          )
                      )
                  ),
              ),
            ),
          ]
      ),
      bottomNavigationBar: BottomAppBar(
          color: Color(0XFFC1C4FF),
          child: Container(
              height: MediaQuery.of(context).size.height*0.10,
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    IconButton(
                        iconSize: 45,
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
                        color: Colors.black,
                        icon: Icon(Icons.location_on),
                        onPressed: () {
                          Navigator.pushNamed(context, '/safespaces');
                        }
                    ),
                    IconButton(
                        iconSize: 45,
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
                        color: Colors.black,
                        icon: Icon(Icons.home),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        }
                    ),
                    IconButton(
                        iconSize: 45,
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
                        color: Colors.black,
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          Navigator.pushNamed(context, '/settings');
                        }
                    )
                  ]
              )
          )
      ),
    );
  }
}