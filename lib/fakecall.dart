import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class FakeCall extends StatefulWidget {
  @override
  _FakeCallState createState() => _FakeCallState();
}
Icon audioIcon = new Icon(
    Icons.play_arrow_rounded,
    color:  Color(0XFFFF8080)
);
Text audioLabel = new Text(
    "Play",
    style: TextStyle(
        fontFamily: 'Josefin Sans',
        fontSize: 36,
        color: Colors.black
    )
);
bool first = true;
class _FakeCallState extends State<FakeCall> {
  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  Duration duration  = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState(){
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState((){
        duration = newDuration;
      });

    player.onPositionChanged.listen((newPosition){
        setState((){
          position = newPosition;
        });
      });
    });

    super.initState();
  }

  void dispose(){
    player.dispose();
    super.dispose();
  }
  Future setAudio() async {
    player.setSourceAsset('assets/audios/fakecall.mp3');
  }
  Widget build(BuildContext context){
    playMessage(){
      audioIcon = new Icon(Icons.pause_outlined,  color: Color(0XFFFF8080));
      audioLabel = new Text("Pause",
          style: TextStyle(
              fontFamily: 'Josefin Sans',
              fontSize: 36,
              color: Colors.black
          )
      );
      player.play(AssetSource('audios/fakecall.mp3'));
    }
    pauseMessage(){
      audioIcon = new Icon(Icons.play_arrow_rounded, color:  Color(0XFFFF8080));
      audioLabel = new Text("Play",
          style: TextStyle(
              fontFamily: 'Josefin Sans',
              fontSize: 36,
              color: Colors.black
          )
      );
      player.pause();
    }

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
              'Recorded Call',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black
              )
          ),
          backgroundColor: Color(0XFFC1C4FF)
      ),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget> [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02
              ),
              Center(
                  child: IconButton(
                      onPressed: (){
                        if (isPlaying == true) {
                          setState(() {
                            pauseMessage();
                          });
                        } else{
                          setState((){
                            playMessage();
                          });
                        }
                      },
                      icon: audioIcon,
                      iconSize: 200,
                      color: Color(0XFFFF8080)
                  )
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02
              ),
              Center(
                  child: audioLabel
              ),
              Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    position = Duration(seconds:value.toInt());
                    await player.seek(position);
                    await player.resume();
                  }
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, MediaQuery.of(context).size.width*0.05,0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0XFFC1C4FF),
                        shape: BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(2, 4),
                          )]
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                      child: Center(
                          child: const Text(
                              "Audio: Hey are you walking home?",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: 'Josefin Sans',
                                  fontSize: 24,
                                  color: Colors.black
                              )
                          )
                      ),
                    ),
                  )
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, MediaQuery.of(context).size.width*0.05,0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0XFFFF8080),
                    shape: BoxShape.rectangle,
                      border: Border.all(
                          width: 2
                      ),
                    boxShadow: [
                      BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(2, 4),
                    )]
                  ),
                 child: Padding(
                   padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                   child: Center(
                    child: Text(
                      'You: yes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Josefin Sans',
                          fontSize: 24,
                          color: Colors.black
                        )
                   )
                 ),
                ),
              )
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, MediaQuery.of(context).size.width*0.05,0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0XFFC1C4FF),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(2, 4),
                        )]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                    child: Center(
                      child: Text(
                          "Audio: Alright well, you're late and mom made me come pick you up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Josefin Sans',
                              fontSize: 24,
                              color: Colors.black
                          )
                      )
                  ),
                ),
              )
            ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, MediaQuery.of(context).size.width*0.05,0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0XFFFF8080),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          width: 2
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(2, 4),
                        )]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                    child: Center(
                      child: Text(
                          "What, why?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Josefin Sans',
                              fontSize: 24,
                              color: Colors.black
                          )
                      )
                  ),
                ),
              )
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04
              ),
          Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, MediaQuery.of(context).size.width*0.05,0),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0XFFC1C4FF),
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(2, 4),
                )]
          ),
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
            child: Center(
              child: Text(
                  "Audio: I don't know, she's mom she worries about everything. She's tracking your phone you know, She sent me your phone location",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Josefin Sans',
                      fontSize: 24,
                      color: Colors.black
                    )
                )
              ),
            )
            )
          ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, MediaQuery.of(context).size.width*0.05,0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0XFFFF8080),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          width: 2
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(2, 4),
                        )]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                    child: Center(
                      child: Text(
                          "ARE YOU SERIOUS?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Josefin Sans',
                              fontSize: 24,
                              color: Colors.black
                          )
                      )
                  ),
                ),
              ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, MediaQuery.of(context).size.width*0.05,0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0XFFC1C4FF),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(2, 4),
                        )]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                    child: Center(
                        child: Text(
                            "Audio: Hold on one second, yes sir? Can't park here. Yes sir I'm moving now. There's a cop here I'm not allowed to park here he says...I'll meet you at the corner",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Josefin Sans',
                                fontSize: 24,
                                color: Colors.black
                            )
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, MediaQuery.of(context).size.width*0.05,0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0XFFFF8080),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          width: 2
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(2, 4),
                        )]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                    child: Center(
                        child: Text(
                            "Sounds good",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Josefin Sans',
                                fontSize: 24,
                                color: Colors.black
                            )
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, MediaQuery.of(context).size.width*0.05,0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0XFFC1C4FF),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(2, 4),
                        )]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                    child: Center(
                        child: Text(
                            "Audio: Just stay on the phone with me okay?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Josefin Sans',
                                fontSize: 24,
                                color: Colors.black
                            )
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, MediaQuery.of(context).size.width*0.05,0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0XFFFF8080),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          width: 2
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(2, 4),
                        )]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                    child: Center(
                        child: Text(
                            "Okay!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Josefin Sans',
                                fontSize: 24,
                                color: Colors.black
                            )
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02
              )
            ]
        ),

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
