import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
class Signup extends StatefulWidget{
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController contact1Controller1 = new TextEditingController();
  TextEditingController contact1Controller2 = new TextEditingController();
  TextEditingController contact2Controller1 = new TextEditingController();
  TextEditingController contact2Controller2 = new TextEditingController();
  TextEditingController contact3Controller1 = new TextEditingController();
  TextEditingController contact3Controller2 = new TextEditingController();
  late File jsonFile;
  late Directory dir;
  String fileName = "database.json";
  bool fileExists = false;
  late Map<String, dynamic> fileContent;

  @override
  void initState(){
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    });
  }

  void dispose() {
    nameController.dispose();
    contact1Controller1.dispose();
    contact1Controller2.dispose();
    contact2Controller1.dispose();
    contact2Controller2.dispose();
    contact3Controller1.dispose();
    contact3Controller2.dispose();
    super.dispose();
  }

  void createFile(Map<String, dynamic> content, Directory dir, String fileName) {
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }
  void writeToFile(String key, String value) {
    Map<String, dynamic> content = {key: value};
    if (fileExists) {
      Map<String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      createFile(content, dir, fileName);
    }
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    print(fileContent);
  }



  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Padding(
              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.25, 0, MediaQuery.of(context).size.width*0.25, 0),
              child: Image.asset('assets/images/FeelSafe.png', height: 200, width: 200)
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.02, MediaQuery.of(context).size.width*0.02, 0),
              child: Text(
                "Sign Up to Continue",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Work Sans',
              )
             ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height*0.03
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01, 0, MediaQuery.of(context).size.height * 0.01),
                child: Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: 'Josefin Sans'
                    )
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01, MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01),
                child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your full name'
                    )
                )
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height*0.02
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01, 0, MediaQuery.of(context).size.height * 0.01),
                child: Text(
                    'Contact #1 Name',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: 'Josefin Sans'
                    )
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01, MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01),
                child: TextFormField(
                    controller: contact1Controller1,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter your first contact's name"
                    )
                )
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height*0.02
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01, 0, MediaQuery.of(context).size.height * 0.01),
                child: Text(
                    'Contact #1 Phone Number',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: 'Josefin Sans'
                    )
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01, MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01),
                child: TextFormField(
                    controller: contact1Controller2,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter. digitsOnly],
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter your first contact's phone number"
                    )
                )
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height*0.02
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01, 0, MediaQuery.of(context).size.height * 0.01),
                child: Text(
                    'Contact #2 Name',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: 'Josefin Sans'
                    )
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01, MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01),
                child: TextFormField(
                    controller: contact2Controller1,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter your second contact's name"
                    )
                )
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height*0.02
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01, 0, MediaQuery.of(context).size.height * 0.01),
                child: Text(
                    'Contact #2 Phone Number',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: 'Josefin Sans'
                    )
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01, MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01),
                child: TextFormField(
                    controller: contact2Controller2,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter. digitsOnly],
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter your second contact's phone number"
                    )
                )
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height*0.02
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01, 0, MediaQuery.of(context).size.height * 0.01),
                child: Text(
                    'Contact #3 Name',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: 'Josefin Sans'
                    )
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01, MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01),
                child: TextFormField(
                    controller: contact3Controller1,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter your third contact's name"
                    )
                )
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height*0.02
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01, 0, MediaQuery.of(context).size.height * 0.01),
                child: Text(
                    'Contact #3 Phone Number',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: 'Josefin Sans'
                    )
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01, MediaQuery.of(context).size.width * 0.03, MediaQuery.of(context).size.height * 0.01),
                child: TextFormField(
                    controller: contact3Controller2,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter. digitsOnly],
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter your third contact's phone number"
                    )
                )
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height*0.04
            ),
            Center(
                child: TextButton(
                    onPressed: () {
                        writeToFile('name', nameController.text);
                        writeToFile('contact1Name', contact1Controller1.text);
                        writeToFile('contact1Number', contact1Controller2.text);
                        writeToFile('contact2Name', contact2Controller1.text);
                        writeToFile('contact2Number', contact2Controller2.text);
                        writeToFile('contact3Name', contact3Controller1.text);
                        writeToFile('contact3Number', contact3Controller2.text);
                        Navigator.pushNamed(context, '/home');
                    },
                    child: Text("Create Account"),
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.7, MediaQuery.of(context).size.height * 0.07),
                        backgroundColor:Color(0XFFFF8080),
                        primary: Colors.white,
                        textStyle: TextStyle(
                            letterSpacing: 2,
                            fontSize: 24,
                            color: Colors.white
                        )
                    )
                )
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.2
            )
          ]
        )
      )
    );
  }
}