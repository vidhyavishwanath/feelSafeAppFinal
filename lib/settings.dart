import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  @override
  Widget build (BuildContext context){
    return Scaffold(
        appBar: AppBar(
            leading: ModalRoute.of(context)?.canPop == true
                ? IconButton(
              icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black
              ),
              onPressed: () => Navigator.of(context).pop(),
            ) : null,
            title: Text(
                'Settings',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black
                )
            ),
            backgroundColor: Color(0XFFC1C4FF)
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
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
                          onPressed: () {},
                          child: Text("SAVE"),
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
